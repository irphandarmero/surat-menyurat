unit uJenisSuratDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, uQueryDebugger,
  uDm, Override.Standard, Data.DB, MemDS, VirtualTable, Vcl.StdCtrls;

type
  TfrmDialogJenisSurat = class(TForm)
    pnTop: TPanel;
    pnBottom: TPanel;
    sgDialog: TStringGrid;
    btOk: TButton;
    btCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private
    FId : string;
    FNama : string;
    FKode : string;
    { Private declarations }
  public
    property idJenisSurat : string read FId write FId;
    property namaJenisSurat : string read FNama write FNama;
    property kodeSurat : string read FKode write FKode;

    { Public declarations }
  end;

var
  frmDialogJenisSurat: TfrmDialogJenisSurat;


implementation

{$R *.dfm}

procedure TfrmDialogJenisSurat.btOkClick(Sender: TObject);
var selectedRow : Integer;
begin
  selectedRow := sgDialog.Row;
  ModalResult := mrYes;
  idJenisSurat := sgDialog.Cells[0, selectedRow];
  namaJenisSurat := sgDialog.Cells[1, selectedRow];
  kodeSurat := sgDialog.Cells[2, selectedRow];
end;

procedure TfrmDialogJenisSurat.FormShow(Sender: TObject);
var SQL : string;
begin
  SQL := TQueryBuilder.Create
          .Select('*')
          .From('jenisSurat')
          .Build;
  dm.qTemp.Close;
  dm.qTemp.SQL.Text := SQL;
  dm.qTemp.ExecWithDebug;

  sgDialog.AssignData(dm.qTemp);
  sgDialog.AutoSizeColumn;

end;

end.
