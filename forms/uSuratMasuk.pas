unit uSuratMasuk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls, Override.Standard,
  Vcl.WinXCtrls, dxGDIPlusClasses, Data.DB, Vcl.DBGrids;

type
  TfrmSuratMasuk = class(TForm)
    pnTop: TPanel;
    sbSearch: TSearchBox;
    btAdd: TButton;
    btEdit: TButton;
    btDelete: TButton;
    DBGrid1: TDBGrid;
    procedure btAddClick(Sender: TObject);
  private
    { Private declarations }
  public
//    procedure AddButtonToGrid(ACol, ARow: Integer);
    { Public declarations }
  end;

var
  frmSuratMasuk: TfrmSuratMasuk;

implementation

{$R *.dfm}

uses uDm, uSuratMasukInput;

//procedure TfrmSuratMasuk.AddButtonToGrid(ACol, ARow: Integer);
//var
//  Btn: TButton;
//  CellRect: TRect;
//begin
//  // Buat tombol baru
//  Btn := TButton.Create(Self);
//  Btn.Parent := sgSuratMasuk;  // Atur parent ke StringGrid1
//  Btn.Caption := 'Action';    // Setel caption tombol
//  Btn.Images := dm.imlIcons16;
//  Btn.ImageIndex := 6;
//  Btn.Height := 24;
//  Btn.Width := 40;

  // Dapatkan posisi sel yang dipilih di grid
//  CellRect := sgSuratMasuk.CellRect(ACol, ARow);

  // Atur posisi dan ukuran tombol berdasarkan posisi sel
//  Btn.Left := sgSuratMasuk.Left + CellRect.Left;
//  Btn.Top := sgSuratMasuk.Top + CellRect.Top;
//  Btn.Width := CellRect.Right - CellRect.Left;
//  Btn.Height := CellRect.Bottom - CellRect.Top;

//  // Tangani event OnClick untuk tombol
//  Btn.OnClick := procedure(Sender: TObject)
//    begin
//      ShowMessage('Action button clicked for row: ' + IntToStr(ARow));
//      // Implementasi logika tombol
//    end;
//end;
procedure TfrmSuratMasuk.btAddClick(Sender: TObject);
begin
  frmSuratMasukInput := TfrmSuratMasukInput.Create(Self);
  try
    frmSuratMasukInput.ShowModal;
  finally
    frmSuratMasukInput.Free;
  end;
end;

end.
