program sism;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmUtama},
  uDm in 'uDm.pas' {dm: TDataModule},
  uSuratMasuk in 'forms\uSuratMasuk.pas' {frmSuratMasuk},
  uSetting in 'forms\uSetting.pas' {frmSetting},
  uSuratMasukInput in 'forms\uSuratMasukInput.pas' {frmSuratMasukInput},
  Override.Standard in '..\lib-helper\Override.Standard.pas',
  uQueryDebugger in '..\lib-helper\uQueryDebugger.pas' {frmQueryDebugger},
  uJenisSurat in 'forms\uJenisSurat.pas' {frmJenisSurat},
  uJenisSuratDialog in 'forms\uJenisSuratDialog.pas' {frmDialogJenisSurat},
  uMitra in 'forms\uMitra.pas' {frmMitra},
  uMitraInput in 'forms\uMitraInput.pas' {frmMitraInput},
  uMitraDialog in 'forms\uMitraDialog.pas' {frmDialogMitra};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmUtama, frmUtama);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmSuratMasuk, frmSuratMasuk);
  Application.CreateForm(TfrmSetting, frmSetting);
  Application.CreateForm(TfrmQueryDebugger, frmQueryDebugger);
  Application.CreateForm(TfrmJenisSurat, frmJenisSurat);
  Application.CreateForm(TfrmDialogJenisSurat, frmDialogJenisSurat);
  Application.CreateForm(TfrmMitra, frmMitra);
  Application.CreateForm(TfrmMitraInput, frmMitraInput);
  Application.CreateForm(TfrmDialogMitra, frmDialogMitra);
  Application.Run;
end.
