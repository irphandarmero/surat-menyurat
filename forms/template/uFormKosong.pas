unit uFormKosong;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Grids,
  Vcl.ExtCtrls, Vcl.Menus, uDm, uQueryDebugger, Override.Standard;

type
  TfrmTemplateMain = class(TForm)
    pnTop: TPanel;
    sgMitra: TStringGrid;
    sbSearch: TSearchBox;
    btAdd: TButton;
    option: TPopupMenu;
    Ubah1: TMenuItem;
    procedure btAddClick(Sender: TObject);
    procedure Ubah1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure RefreshForm;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTemplateMain: TfrmTemplateMain;

implementation

{$R *.dfm}

uses uMitraInput;
procedure TfrmTemplateMain.FormShow(Sender: TObject);
begin
  RefreshForm;
end;

procedure TfrmTemplateMain.RefreshForm;
var SQL : string;
begin
  SQL := TQueryBuilder.Create
          .Select('*')
          .From('mitra')
          .Where('isAktif = 1')
          .Build;
  dm.qTemp.Close;
  dm.qTemp.SQL.Text := SQL;
  dm.qTemp.ExecWithDebug;

  sgMitra.AssignData(dm.qTemp);
  sgMitra.AutoSizeColumn;
end;
procedure TfrmTemplateMain.btAddClick(Sender: TObject);
begin
  frmMitraInput := TfrmMitraInput.Create(Self);
  try
    frmMitraInput.StatusBuat := 'baru';
    frmMitraInput.ShowModal;
  finally
    frmMitraInput.Free;
  end;
end;

procedure TfrmTemplateMain.Ubah1Click(Sender: TObject);
var selectedRow : Integer;
    aktif : integer;
begin
  selectedRow := sgMitra.Row;
  frmMitraInput := TfrmMitraInput.Create(Self);
  try
    frmMitraInput.StatusBuat := 'ubah';
    frmMitraInput.IdMitra := sgMitra.Cells[0, selectedRow];
    frmMitraInput.edNamaMitra.Text := sgMitra.Cells[1, selectedRow];
    frmMitraInput.mmAlamat.Text := sgMitra.Cells[2, selectedRow];
    frmMitraInput.edCP.Text := sgMitra.Cells[3, selectedRow];
    frmMitraInput.edNoHP.Text := sgMitra.Cells[4, selectedRow];
    if sgMitra.Cells[5, selectedRow] = 'True' then
      aktif := 1 else aktif := 0;
    frmMitraInput.cbAktif.ItemIndex := aktif;
    frmMitraInput.ShowModal;
  finally
    frmMitraInput.Free;
  end;
end;

end.
