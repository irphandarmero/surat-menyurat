unit uMitra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Grids,
  Vcl.ExtCtrls;

type
  TfrmMitra = class(TForm)
    pnTop: TPanel;
    sgMitra: TStringGrid;
    sbSearch: TSearchBox;
    btAdd: TButton;
    procedure btAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMitra: TfrmMitra;

implementation

{$R *.dfm}

uses uMitraInput;

procedure TfrmMitra.btAddClick(Sender: TObject);
begin
  frmMitraInput := TfrmMitraInput.Create(Self);
  try
    frmMitraInput.ShowModal;
  finally
    frmMitraInput.Free;
  end;
end;

end.
