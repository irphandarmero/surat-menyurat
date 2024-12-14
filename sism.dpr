program sism;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmUtama},
  uQueryDebugger in 'forms\uQueryDebugger.pas' {frmQueryDebugger},
  uDm in 'uDm.pas' {dm: TDataModule},
  uSuratMasuk in 'forms\uSuratMasuk.pas' {frmSuratMasuk},
  Override.Standard in 'units\Override.Standard.pas',
  uSetting in 'forms\uSetting.pas' {frmSetting},
  uSuratMasukInput in 'forms\uSuratMasukInput.pas' {frmSuratMasukInput};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmUtama, frmUtama);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmQueryDebugger, frmQueryDebugger);
  Application.CreateForm(TfrmSuratMasuk, frmSuratMasuk);
  Application.CreateForm(TfrmSetting, frmSetting);
  Application.Run;
end.
