unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.CategoryButtons, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, uQueryDebugger,
  dxGDIPlusClasses;

type
  TOnCloseTab = procedure(sender : TObject) of Object;

  TTabSheet = class(Vcl.ComCtrls.TTabSheet)
    private
      FOnCloseTab: TOnCloseTab;
    public
      property OnCloseTab: TOnCloseTab read FOnCloseTab write FOnCloseTab;
  end;

  TfrmUtama = class(TForm)
    pnContent: TPanel;
    pnTop: TPanel;
    SV: TSplitView;
    catMenuItems: TCategoryButtons;
    catMenuBottom: TCategoryButtons;
    pcMain: TPageControl;
    imgMenu: TImage;
    procedure catMenuItemsCategories1Items0Click(Sender: TObject);
    procedure pcMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure catMenuItemsCategories0Items0Click(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure FormResize(Sender: TObject);  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUtama: TfrmUtama;

implementation

{$R *.dfm}

uses uDm, uSetting, uSuratMasuk;

procedure TfrmUtama.catMenuItemsCategories0Items0Click(Sender: TObject);
begin
  dm.OpenTab(frmSuratMasuk);
end;

procedure TfrmUtama.catMenuItemsCategories1Items0Click(Sender: TObject);
begin
  dm.OpenTab(frmSetting);
end;

procedure TfrmUtama.FormResize(Sender: TObject);
begin
  if frmUtama.Width < 640 then SV.Close else SV.Open;


end;

procedure TfrmUtama.imgMenuClick(Sender: TObject);
begin
  if SV.Opened then SV.Close else SV.Open;
  
end;

procedure TfrmUtama.pcMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  xxx: Integer;
  rec: TRect;
  tab: TTabSheet;
  frm: TForm;
  act: TCloseAction;
begin
  if Button = mbLeft then
  begin
    xxx := pcMain.IndexOfTabAt(X, Y);
    tab := uMain.TTabSheet(pcMain.Pages[xxx]);
    rec := pcMain.TabRect(xxx);
    xxx := rec.Right;
    act := caNone;

    if xxx - X < 17 then
    begin
      if tab.HelpContext <> 0 then
      begin
        frm := TForm(tab.HelpContext);
        if Assigned(frm.OnClose) then
        frm.OnClose(frm, act);
        frm.HelpContext := 0;
        frm.Parent      := nil;
        frm.Close;
      end;
      tab.Free;
    end;
  end;
end;

end.
