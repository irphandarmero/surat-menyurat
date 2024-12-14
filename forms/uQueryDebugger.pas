unit uQueryDebugger;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Comp.Client;

type
  TFDQuery = class(FireDAC.Comp.Client.TFDQuery)
    private
      function isSelect: Boolean;
    public
      function ExecWithDebug: Boolean;
  end;
  TfrmQueryDebugger = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    mmQuery: TMemo;
    btnCopyQuery: TButton;
    btnCopyMessage: TButton;
    mmMessage: TMemo;
    btnClose: TButton;
    procedure btnCopyQueryClick(Sender: TObject);
    procedure btnCopyMessageClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQueryDebugger: TfrmQueryDebugger;

implementation

uses
  vcl.clipbrd, Data.DB;
{$R *.dfm}

function TFDQuery.ExecWithDebug: Boolean;
begin
  try
    if isSelect then
    Open else
    ExecSQL;
    Result := True;
  except
    on E:EDatabaseError do
    begin
      frmQueryDebugger.mmQuery.Text   := SQL.Text;
      frmQueryDebugger.mmMessage.Text := E.Message;
      frmQueryDebugger.ShowModal;
      result := false;
    end;
    on E:Exception do
    begin
      frmQueryDebugger.mmQuery.Text   := SQL.Text;
      frmQueryDebugger.mmMessage.Text := E.Message;
      frmQueryDebugger.ShowModal;
      result := false;
    end;
  end;
end;
function TFDQuery.isSelect: Boolean;
var
  sss: String;
begin
  sss := LowerCase(trim(SQL.Text));

  result := copy(sss, 1, 6) = 'select';
end;

procedure TfrmQueryDebugger.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmQueryDebugger.btnCopyMessageClick(Sender: TObject);
begin
  Clipboard.AsText := mmMessage.Text;
end;

procedure TfrmQueryDebugger.btnCopyQueryClick(Sender: TObject);
begin
  Clipboard.AsText := mmQuery.Text;
end;

end.
