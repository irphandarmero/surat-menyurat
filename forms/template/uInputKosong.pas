unit uInputKosong;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uDm,
  uQueryDebugger, Override.Standard;

type
  TfrmTemplateInput = class(TForm)
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
    cbAktif: TComboBox;
    Label5: TLabel;
    procedure btSaveClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    { Private declarations }
    procedure InsertMitra;
    procedure UpdateMitra;
  public
    { Public declarations }
    var
      StatusBuat : string;
      IdMitra : string;
  end;

var
  frmTemplateInput: TfrmTemplateInput;

implementation

{$R *.dfm}
procedure TfrmTemplateInput.InsertMitra;
var QueryBuilder : TQueryBuilder;
    SQL : string;
begin
  QueryBuilder := TQueryBuilder.Create;

  try
    SQL := QueryBuilder
            .InsertInto('mitra', 'namaMitra, alamatMitra, namaPicMitra, nomorPicMitra')
            .Values(':nama, :alamat, :cp, :nohp')
            .AddParameter('nama', edNamaMitra.Text, ptString)
            .AddParameter('alamat', mmAlamat.Text, ptString)
            .AddParameter('cp', edCP.Text, ptString)
            .AddParameter('nohp', edNoHP.Text, ptString)
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
procedure TfrmTemplateInput.UpdateMitra;
var QueryBuilder : TQueryBuilder;
    SQL : string;
begin
  QueryBuilder := TQueryBuilder.Create;

  try
    SQL := QueryBuilder
            .Update('mitra')
            .SetValues(['namaMitra', 'alamatMitra', 'namaPicMitra', 'nomorPicMitra', 'isAktif'])
            .AddParameter('namaMitra', edNamaMitra.Text, ptString)
            .AddParameter('alamatMitra', mmAlamat.Text, ptString)
            .AddParameter('namaPicMitra', edCP.Text, ptString)
            .AddParameter('nomorPicMitra', edNoHP.Text, ptString)
            .AddParameter('isAktif', cbAktif.ItemIndex, ptInteger)
            .Where('IdMitra = :id')
            .AddParameter('id', StrToIntDef(IdMitra, 0), ptInteger)
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

procedure TfrmTemplateInput.btCancelClick(Sender: TObject);
begin
  ModalResult := mrNone;
  frmMitraInput.Close;
end;

procedure TfrmTemplateInput.btSaveClick(Sender: TObject);
begin
  if StatusBuat = 'baru' then
  begin
    InsertMitra;
  end else
  if StatusBuat = 'ubah' then
  begin
    UpdateMitra;
  end;
  ModalResult := mrYes;
end;

end.
