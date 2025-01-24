unit uDialogKosong;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls,
  uDm, uQueryDebugger, Override.Standard;

type
  TfrmTemplateDialog = class(TForm)
    pnBottom: TPanel;
    pnTop: TPanel;
    sgDialog: TStringGrid;
    btOk: TButton;
    btCancel: TButton;
    btBaru: TButton;
    procedure FormShow(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btBaruClick(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshForm;
  public
    { Public declarations }

    var
      IdMitra : string;
      NamaMitra : string;
  end;

var
  frmTemplateDialog: TfrmTemplateDialog;


implementation

{$R *.dfm}

uses uMitraInput;
procedure TfrmTemplateDialog.RefreshForm;
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

  sgDialog.AssignData(dm.qTemp);
  sgDialog.AutoSizeColumn;

end;
procedure TfrmTemplateDialog.btBaruClick(Sender: TObject);
begin
  frmMitraInput := TfrmMitraInput.Create(Self);
  try
    frmMitraInput.StatusBuat := 'baru';
    frmMitraInput.ShowModal;
  finally
    if frmMitraInput.ModalResult = mrYes then RefreshForm;
    frmMitraInput.Free;
  end;
end;

procedure TfrmTemplateDialog.btOkClick(Sender: TObject);
var selectedRow : Integer;
begin
  selectedRow := sgDialog.Row;
  ModalResult := mrYes;
  IdMitra := sgDialog.Cells[0, selectedRow];
  NamaMitra := sgDialog.Cells[1, selectedRow];

end;

procedure TfrmTemplateDialog.FormShow(Sender: TObject);
begin
  RefreshForm;

end;

end.
