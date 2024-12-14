unit uDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Forms, Vcl.ComCtrls, Vcl.WinXctrls,
  IniFiles,uQueryDebugger, Override.Standard, System.ImageList, Vcl.ImgList,
  Vcl.Controls, System.Actions, Vcl.ActnList;

type
  TOnCloseTab = procedure(sender : TObject) of Object;

  TTabSheet = class(Vcl.ComCtrls.TTabSheet)
    private
      FOnCloseTab: TOnCloseTab;
    public
      property OnCloseTab: TOnCloseTab read FOnCloseTab write FOnCloseTab;
  end;

  Tdm = class(TDataModule)
    Conn: TFDConnection;
    qTemp: TFDQuery;
    imlIcons16: TImageList;
    actMain: TActionList;
    actSuratMasuk: TAction;
    actSuratKeluar: TAction;
    actUsers: TAction;
    actMitra: TAction;
    actJenisSurat: TAction;
    actLogout: TAction;
    actSetting: TAction;
    actLogin: TAction;
    procedure actSuratMasukExecute(Sender: TObject);
  private
    { Private declarations }
  public
    var
    StrServerName, StrDatabaseName, StrDBUsername, StrDBPassword, StrDBPort : string;
    procedure KoneksiMySQL;
    function Connecting:Boolean;
    procedure OpenTab(AForm: TForm);
    procedure LoadSettings;
    { Public declarations }
  end;

var
  dm: Tdm;

//  procedure Log(const Msg: string);
  procedure AutoSizeGrid(Grid: TStringGrid);
  procedure ClearStringGrid(const Grid: TStringGrid);
  procedure Sortgrid(Grid : TStringGrid; SortCol:integer);
  procedure DeleteCurrentRow(Grid: TStringGrid);

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uMain, uSuratMasuk;

{$R *.dfm}
procedure Tdm.LoadSettings;
var
  konfigurasi : TMemIniFile;
begin
  konfigurasi := TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Setting.ini');
  try
  with konfigurasi do
  begin
    StrServerName := ReadString('Setting Database','ServerName','0');
    StrDatabaseName := ReadString('Setting Database','DatabaseName','0');
    StrDBUsername := ReadString('Setting Database','Username','0');
    StrDBPassword := ReadString('Setting Database','Password', '0');
    StrDBPort := ReadString('Setting Database','Port', '0');

    frmUtama.SV.CloseStyle := TSplitViewCloseStyle(ReadInteger('Split View','CloseStyle',0));
    frmUtama.SV.DisplayMode := TSplitViewDisplayMode(ReadInteger('Split View','DisplayMode',0));
    frmUtama.SV.Placement := TSplitViewPlacement(ReadInteger('Split View','Placement',0));

    //cbxVclStyles.ItemIndex := ReadInteger('Theme','Form', 0);
  end;
  finally
    FreeAndNil(konfigurasi);
  end;


end;
procedure Tdm.KoneksiMySQL;
begin
  Conn.DriverName := 'MySQL';
  Conn.Params.Add('Server=' + StrServerName);
  Conn.Params.Add('Database=' + StrDatabaseName);
  Conn.Params.Add('User_name=' + StrDBUsername);
  Conn.Params.Add('Password=' + StrDBPassword);
  Conn.Params.Add('Port=' + StrDBPort);
  Conn.LoginPrompt:=False;
  Conn.Connected := True;
end;
procedure Tdm.OpenTab(AForm: TForm);
var
  page : TPageControl;
  tab : TTabSheet;
begin
  if AForm.HelpContext = 0 then
  begin

    page := frmUtama.pcMain;
    tab := TTabSheet.Create(self);

    tab.Caption       := AForm.Caption + '           ❎';
    tab.HelpContext   := integer(AForm);
    AForm.HelpContext := Integer(tab);
    tab.PageControl   := Page;
    Page.ActivePage   := tab;
    AForm.Parent      := tab;
    AForm.BorderStyle := bsNone;
    AForm.Show;
  end else
  begin
    tab := TTabSheet(AForm.HelpContext);
    Page.ActivePage := tab;
  end;

  if Assigned(AForm.OnShow) then
  AForm.OnShow(AForm);
end;
procedure Tdm.actSuratMasukExecute(Sender: TObject);
begin
  OpenTab(frmSuratMasuk);
end;

function Tdm.Connecting:Boolean;
begin
  if Conn.Connected = True then
  begin
    Result := True;
  end else
  begin
    KoneksiMySQL;
  end;
end;
procedure Sortgrid(Grid : TStringGrid; SortCol:integer);
{A simple exchange sort of grid rows}
var
   i,j : integer;
   n : integer;
   temp:tstringlist;
begin
  temp:=tstringlist.create;
  with Grid do
  for i := FixedRows to RowCount - 2 do  {because last row has no next row}
  for j:= i+1 to rowcount-1 do {from next row to end}
  if AnsiCompareText(Cells[SortCol, i], Cells[SortCol,j]) > 0
  then
  begin
    temp.assign(rows[j]);
    rows[j].assign(rows[i]);
    rows[i].assign(temp);
  end;

  n := 0;
  for i := 1 to Grid.RowCount-1 do
    begin
      Inc(n);
      Grid.Cells[0,i] := IntToStr(n);
    end;

  temp.free;
end;

procedure ClearStringGrid(const Grid: TStringGrid);
var C, R : integer;
begin
  for C := 0 to Pred(Grid.ColCount) do
    for R := 1 to Pred(Grid.RowCount) do
      Grid.Cells[C, R] := '';
end;

procedure AutoSizeGrid(Grid: TStringGrid);
const
  ColWidthMin = 10;
var
  C, R, W, ColWidthMax: integer;
begin
  for C := 0 to Grid.ColCount - 1 do begin
    ColWidthMax := ColWidthMin;
    for R := 0 to (Grid.RowCount - 1) do begin
      W := Grid.Canvas.TextWidth(Grid.Cells[C, R]);
      if W > ColWidthMax then
        ColWidthMax := W;
    end;
    Grid.ColWidths[C] := ColWidthMax + 30;
  end;
end;
procedure DeleteCurrentRow(Grid: TStringGrid);
var
  i: Integer;
  n: integer;
begin
  for i := Grid.Row to Grid.RowCount - 2 do
    Grid.Rows[i].Assign(Grid.Rows[i + 1]);
  Grid.RowCount := Grid.RowCount - 1;

  n := 0;
  for i := 1 to Grid.RowCount-1 do
    begin
      Inc(n);
      Grid.Cells[0,i] := IntToStr(n);
    end;
end;

end.
