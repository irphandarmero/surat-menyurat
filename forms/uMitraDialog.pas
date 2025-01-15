unit uMitraDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDm, uQueryDebugger, Override.Standard,
  Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

type
  TfrmDialogMitra = class(TForm)
    pnBottom: TPanel;
    pnTop: TPanel;
    sgMitra: TStringGrid;
    btOk: TButton;
    btCancel: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogMitra: TfrmDialogMitra;

implementation

{$R *.dfm}

end.
