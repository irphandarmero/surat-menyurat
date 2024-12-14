unit uSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.CategoryButtons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Themes, Vcl.WinXctrls, IniFiles, Override.Standard;

type
  TfrmSetting = class(TForm)
    lblVclStyle: TLabel;
    cbxVclStyles: TComboBox;
    chkCloseOnMenuClick: TCheckBox;
    grpAnimation: TGroupBox;
    lblAnimationDelay: TLabel;
    lblAnimationStep: TLabel;
    chkUseAnimation: TCheckBox;
    trkAnimationDelay: TTrackBar;
    trkAnimationStep: TTrackBar;
    grpCloseStyle: TRadioGroup;
    grpDisplayMode: TRadioGroup;
    grpPlacement: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edServerName: TEdit;
    edDatabaseName: TEdit;
    edDBUsername: TEdit;
    edDBPassword: TEdit;
    btDBSimpan: TButton;
    btDBTest: TButton;
    edDBPort: TEdit;
    pcSetting: TPageControl;
    TabDBSetting: TTabSheet;
    TabLayoutSetting: TTabSheet;
    TabLog: TTabSheet;
    lblLog: TLabel;
    lstLog: TListBox;
    Panel1: TPanel;
    btLOSimpan: TButton;
    procedure btDBSimpanClick(Sender: TObject);
    procedure btLOSimpanClick(Sender: TObject);
    procedure cbxVclStylesChange(Sender: TObject);
    procedure chkUseAnimationClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grpCloseStyleClick(Sender: TObject);
    procedure grpDisplayModeClick(Sender: TObject);
    procedure grpPlacementClick(Sender: TObject);
    procedure trkAnimationDelayChange(Sender: TObject);
    procedure trkAnimationStepChange(Sender: TObject);
    procedure btDBTestClick(Sender: TObject);
    procedure pcSettingChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SimpanKonfigurasiDatabase;
    procedure SimpanKonfigurasiLayout;
    procedure AmbilKonfigurasi;
  end;

var
  frmSetting: TfrmSetting;

implementation

{$R *.dfm}

uses uDm, uMain;
procedure TfrmSetting.SimpanKonfigurasiLayout;
var
  konfigurasi : TMemIniFile;
begin
  konfigurasi := TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Setting.ini');
  try
  with konfigurasi do
  begin
    WriteInteger('Split View','CloseStyle', grpCloseStyle.ItemIndex);
    WriteInteger('Split View','DisplayMode', grpDisplayMode.ItemIndex);
    WriteInteger('Split View','Placement', grpPlacement.ItemIndex);

    WriteInteger('Theme','Form', cbxVclStyles.ItemIndex);
    UpdateFile;
    ShowMessage('Berhasil disimpan.');
  end;
  finally
    FreeAndNil(konfigurasi);
  end;
end;
procedure TfrmSetting.SimpanKonfigurasiDatabase;
var
  konfigurasi : TMemIniFile;
begin
  konfigurasi := TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Setting.ini');
  try
  with konfigurasi do
  begin
    WriteString('Setting Database','ServerName', edServerName.Text);
    WriteString('Setting Database','DatabaseName',edDatabaseName.Text);
    WriteString('Setting Database','Username',edDBUsername.Text);
    WriteString('Setting Database','Password', edDBPassword.Text);
    WriteString('Setting Database','Port', edDBPort.Text);

    WriteInteger('Theme','Form', cbxVclStyles.ItemIndex);
    UpdateFile;
    ShowMessage('Berhasil disimpan.');
  end;
  finally
    FreeAndNil(konfigurasi);
  end;
end;
procedure TfrmSetting.AmbilKonfigurasi;
var
  konfigurasi : TMemIniFile;
begin
  konfigurasi := TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Setting.ini');
  try
  with konfigurasi do
  begin
    edServerName.Text := ReadString('Setting Database','ServerName','0');
    edDatabaseName.Text := ReadString('Setting Database','DatabaseName','0');
    edDBUsername.Text := ReadString('Setting Database','Username','0');
    edDBPassword.Text := ReadString('Setting Database','Password', '0');
    edDBPort.Text := ReadString('Setting Database','Port', '0');

    grpCloseStyle.ItemIndex := ReadInteger('Split View','CloseStyle',0);
    grpDisplayMode.ItemIndex := ReadInteger('Split View','DisplayMode',0);
    grpPlacement.ItemIndex := ReadInteger('Split View','Placement',0);
    //cbxVclStyles.ItemIndex := ReadInteger('Theme','Form', 0);
  end;
  finally
    FreeAndNil(konfigurasi);
  end;
end;

procedure TfrmSetting.btDBSimpanClick(Sender: TObject);
begin
  SimpanKonfigurasiDatabase;
end;

procedure TfrmSetting.btDBTestClick(Sender: TObject);
begin
  with dm.Conn do
  begin
    with Params do begin
    Clear;
      Add('DriverID=MySQL');
      Add('Server='+ edServerName.Text);
      Add('Port='+ edDBPort.Text);
      Add('Database=' + edDatabaseName.Text);
      Add('User_Name='+ edDBUsername.Text);
      Add('Password=' + edDBPassword.Text);
    end;
    Open;
    ShowMessage('Sukses');
  end;


end;

procedure TfrmSetting.btLOSimpanClick(Sender: TObject);
begin
  SimpanKonfigurasiLayout;
end;

procedure TfrmSetting.cbxVclStylesChange(Sender: TObject);
begin
TStyleManager.SetStyle(cbxVclStyles.Text);
end;

procedure TfrmSetting.chkUseAnimationClick(Sender: TObject);
begin
  {SV.UseAnimation := chkUseAnimation.Checked;
  lblAnimationDelay.Enabled := SV.UseAnimation;
  trkAnimationDelay.Enabled := SV.UseAnimation;
  lblAnimationStep.Enabled := SV.UseAnimation;
  trkAnimationStep.Enabled := SV.UseAnimation;  }
end;

procedure TfrmSetting.FormShow(Sender: TObject);
begin
  AmbilKonfigurasi;
end;

procedure TfrmSetting.grpCloseStyleClick(Sender: TObject);
begin
  frmUtama.SV.CloseStyle := TSplitViewCloseStyle(grpCloseStyle.ItemIndex);
end;

procedure TfrmSetting.grpDisplayModeClick(Sender: TObject);
begin
  frmUtama.SV.DisplayMode := TSplitViewDisplayMode(grpDisplayMode.ItemIndex);
end;

procedure TfrmSetting.grpPlacementClick(Sender: TObject);
begin
  frmUtama.SV.Placement := TSplitViewPlacement(grpPlacement.ItemIndex);
end;

procedure TfrmSetting.pcSettingChange(Sender: TObject);
begin
  Panel1.Caption := pcSetting.ActivePage.Caption;
end;

procedure TfrmSetting.trkAnimationDelayChange(Sender: TObject);
begin
  frmUtama.SV.AnimationDelay := trkAnimationDelay.Position * 5;
  lblAnimationDelay.Caption := 'Animation Delay (' + IntToStr(frmUtama.SV.AnimationDelay) + ')';
end;

procedure TfrmSetting.trkAnimationStepChange(Sender: TObject);
begin
  frmUtama.SV.AnimationStep := trkAnimationStep.Position * 5;
  lblAnimationStep.Caption := 'Animation Step (' + IntToStr(frmUtama.SV.AnimationStep) + ')';
end;

end.
