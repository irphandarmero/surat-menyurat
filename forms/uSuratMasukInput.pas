unit uSuratMasukInput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  uQueryDebugger, Vcl.ExtCtrls, uDm, Override.Standard;

type
  TfrmSuratMasukInput = class(TForm)
    dtTanggalSurat: TDateTimePicker;
    edNomorSurat: TEdit;
    edPengirim: TEdit;
    lbTanggalSurat: TLabel;
    lbNomorSurat: TLabel;
    lbPengirim: TLabel;
    lbKeterangan: TLabel;
    btSave: TButton;
    btCancel: TButton;
    edKeterangan: TEdit;
    mmUraian: TMemo;
    btJenisSurat: TButton;
    pnButtom: TPanel;
    pnTop: TPanel;
    Label1: TLabel;
    edJenisSurat: TEdit;
    btMitra: TButton;
    Label2: TLabel;
    procedure btSaveClick(Sender: TObject);
    procedure btJenisSuratClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    var
    IdJenisSurat : integer;
  end;

var
  frmSuratMasukInput: TfrmSuratMasukInput;

implementation

{$R *.dfm}

uses uJenisSuratDialog;

procedure TfrmSuratMasukInput.btJenisSuratClick(Sender: TObject);
begin
  frmDialogJenisSurat := TfrmDialogJenisSurat.Create(Self);
  try
    frmDialogJenisSurat.ShowModal;
  finally
    if frmDialogJenisSurat.ModalResult = mrYes then
    begin
      edJenisSurat.Text := frmDialogJenisSurat.namaJenisSurat;
      IdJenisSurat := StrToInt(frmDialogJenisSurat.idJenisSurat);
    end;
    frmDialogJenisSurat.Free;
  end;
end;

procedure TfrmSuratMasukInput.btSaveClick(Sender: TObject);
var SQL : string;
    QueryBuilder : TQueryBuilder;
begin
  QueryBuilder := TQueryBuilder.Create;
  SQL := QueryBuilder
          .InsertInto('suratMasuk', 'tanggalSurat, nomorSurat, pengirim, idJenisSurat, uraian, keterangan, createdAt, createdBy')
          .Values(':tanggal, :nomor, :pengirim, :idJenis, :uraian, :keterangan, :tanggalSimpan, :username')
          .AddParameter('tanggal', FormatDateTime('yyyy-mm-dd HH:ss', dtTanggalSurat.DateTime))
          .AddParameter('nomor', edNomorSurat.Text)
          .AddParameter('pengirim', edPengirim.Text)
          .AddParameter('idJenis', IdJenisSurat)
          .AddParameter('uraian', mmUraian.Text)
          .AddParameter('keterangan', edKeterangan.Text)
          .AddParameter('tanggalSimpan', FormatDateTime('yyyy-mm-dd HH:mm:ss', Now))
          .AddParameter('username', 'irfan')
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

end;

end.
