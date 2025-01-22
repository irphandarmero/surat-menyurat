unit uSuratKeluar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls, Override.Standard,
  Vcl.WinXCtrls, dxGDIPlusClasses, Data.DB, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDm, uQueryDebugger, MemDS,
  VirtualTable, Vcl.Menus;

type
  TfrmSuratKeluar = class(TForm)
    pnTop: TPanel;
    sbSearch: TSearchBox;
    btAdd: TButton;
    sgSuratMasuk: TStringGrid;
    option: TPopupMenu;
    Ubah1: TMenuItem;
    procedure btAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbSearchChange(Sender: TObject);
    procedure Ubah1Click(Sender: TObject);
  private
    { Private declarations }
  public
//    procedure AddButtonToGrid(ACol, ARow: Integer);
    { Public declarations }
    procedure RefreshForm;
  end;

var
  frmSuratKeluar: TfrmSuratKeluar;

implementation

{$R *.dfm}

procedure TfrmSuratKeluar.FormShow(Sender: TObject);
begin
  RefreshForm;
end;

procedure TfrmSuratKeluar.RefreshForm;
  var SQL : string;
begin
//  SQL := TQueryBuilder.Create
//          .Select('sm.idSuratMasuk, sm.tanggalSurat, sm.nomorSurat, sm.idJenisSurat, '+
//          'js.namaJenisSurat, sm.pengirim, sm.uraian, sm.keterangan')
//          .From('suratMasuk sm')
//          .Join('jenisSurat js', 'js.IdJenisSurat = sm.IdJenisSurat')
//          .Build;
//  dm.qTemp.Close;
//  dm.qTemp.SQL.Text := SQL;
//  dm.qTemp.ExecWithDebug;
//
//  sgSuratMasuk.AssignData(dm.qTemp);
//  sgSuratMasuk.AutoSizeColumn;

end;
procedure TfrmSuratKeluar.sbSearchChange(Sender: TObject);
begin
  if Length(sbSearch.Text) > 0 then
  begin
    sgSuratMasuk.Filter(sbSearch.Text, 4);
  end else
  begin
    sgSuratMasuk.ResetFilter;
  end;
end;

procedure TfrmSuratKeluar.Ubah1Click(Sender: TObject);
var selectedRow : Integer;
    aktif : integer;
begin
  selectedRow := sgSuratMasuk.Row;
//  frmSuratMasukInput := TfrmSuratMasukInput.Create(Self);
//  try
//    frmSuratMasukInput.IdSuratMasuk := StrToIntDef(sgSuratMasuk.Cells[0, selectedRow], 0);
//    frmSuratMasukInput.IdJenisSurat := StrToIntDef(sgSuratMasuk.Cells[3, selectedRow], 0);
//    frmSuratMasukInput.edJenisSurat.Text := sgSuratMasuk.Cells[4, selectedRow];
//    frmSuratMasukInput.dtTanggalSurat.Date := StrToDateTime(sgSuratMasuk.Cells[1, selectedRow]);
//    frmSuratMasukInput.edNomorSurat.Text := sgSuratMasuk.Cells[2, selectedRow];
//    frmSuratMasukInput.edPengirim.Text := sgSuratMasuk.Cells[5, selectedRow];
//    frmSuratMasukInput.mmUraian.Text := sgSuratMasuk.Cells[6, selectedRow];
//    frmSuratMasukInput.edKeterangan.Text := sgSuratMasuk.Cells[7, selectedRow];
//    frmSuratMasukInput.StatusBuat := 'ubah';
//    frmSuratMasukInput.ShowModal;
//  finally
//    if frmSuratMasukInput.ModalResult = mrYes then RefreshForm;
//    frmSuratMasukInput.Free;
//  end;
end;

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
procedure TfrmSuratKeluar.btAddClick(Sender: TObject);
begin
//  frmSuratMasukInput := TfrmSuratMasukInput.Create(Self);
//  try
//    frmSuratMasukInput.StatusBuat := 'baru';
//    frmSuratMasukInput.ShowModal;
//  finally
//    if frmSuratMasukInput.ModalResult = mrYes then RefreshForm;
//
//    frmSuratMasukInput.Free;
//  end;
end;

end.
