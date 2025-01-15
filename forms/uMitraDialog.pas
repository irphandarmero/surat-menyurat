unit uMitraDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls, uDm, uQueryDebugger, Override.Standard;

type
  TfrmDialogMitra = class(TForm)
    pnBottom: TPanel;
    pnTop: TPanel;
    sgMitra: TStringGrid;
    btOk: TButton;
    btCancel: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogMitra: TfrmDialogMitra;

implementation

{$R *.dfm}

procedure TfrmDialogMitra.FormShow(Sender: TObject);
var SQL : string;
begin
  SQL := TQueryBuilder.Create
          .Select('*')
          .From('mitra')
          .Build;
  dm.qTemp.Close;
  dm.qTemp.SQL.Text := SQL;
  dm.qTemp.ExecWithDebug;

  sgMitra.AssignData(dm.qTemp);
  sgMitra.AutoSizeColumn;

end;

end.
