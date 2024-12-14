unit uSuratMasukInput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSuratMasukInput: TfrmSuratMasukInput;

implementation

{$R *.dfm}

end.
