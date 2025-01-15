unit uJenisSurat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.WinXCtrls;

type
  TfrmJenisSurat = class(TForm)
    pnTop: TPanel;
    sgJenisSurat: TStringGrid;
    sbSearch: TSearchBox;
    btAdd: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJenisSurat: TfrmJenisSurat;

implementation

{$R *.dfm}

end.
