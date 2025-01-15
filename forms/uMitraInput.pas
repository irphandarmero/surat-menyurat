unit uMitraInput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uDm,
  uQueryDebugger, Override.Standard;

type
  TfrmMitraInput = class(TForm)
    pnTop: TPanel;
    pnBottom: TPanel;
    btSave: TButton;
    btCancel: TButton;
    edNamaMitra: TEdit;
    mmAlamat: TMemo;
    edCP: TEdit;
    edNoHP: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMitraInput: TfrmMitraInput;

implementation

{$R *.dfm}

procedure TfrmMitraInput.btSaveClick(Sender: TObject);
var QueryBuilder : TQueryBuilder;
    SQL : string;
begin
  QueryBuilder := TQueryBuilder.Create;

  try
    SQL := QueryBuilder
            .InsertInto('mitra', 'namaMitra, alamatMitra, namaPicMitra, nomorPicMitra')
            .Values(':nama, :alamat, :cp, :nohp')
            .AddParameter('nama', edNamaMitra.Text)
            .AddParameter('alamat', mmAlamat.Text)
            .AddParameter('cp', edCP.Text)
            .AddParameter('nohp', edNoHP.Text)
            .Build;
    dm.qTemp.Close;
    dm.qTemp.SQL.Text := SQL;
    QueryBuilder.ApplyParams(dm.qTemp);

    if not dm.qTemp.ExecWithDebug then
    begin
      MessageDlg('Gagal jalankan query', mtError, [mbOK], 0);
      exit;
    end;
    MessageDlg('Data berhasil disimpan', mtInformation, [mbOK], 0);
  finally
    QueryBuilder.Free;
  end;
end;

end.
