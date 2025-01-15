unit uSuratMasuk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls, Override.Standard,
  Vcl.WinXCtrls, dxGDIPlusClasses, Data.DB, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDm, uQueryDebugger, MemDS,
  VirtualTable;

type
  TfrmSuratMasuk = class(TForm)
    pnTop: TPanel;
    sbSearch: TSearchBox;
    btAdd: TButton;
    sgSuratMasuk: TStringGrid;
    vTemp: TVirtualTable;
    procedure btAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbSearchChange(Sender: TObject);
  private
    { Private declarations }
  public
//    procedure AddButtonToGrid(ACol, ARow: Integer);
    { Public declarations }
    procedure RefreshForm;
  end;

var
  frmSuratMasuk: TfrmSuratMasuk;

implementation

{$R *.dfm}

uses uSuratMasukInput;

procedure TfrmSuratMasuk.FormShow(Sender: TObject);
begin
  RefreshForm;
end;

procedure TfrmSuratMasuk.RefreshForm;
  var SQL : string;
begin
  SQL := TQueryBuilder.Create
          .Select('sm.idSuratMasuk, sm.tanggalSurat, sm.nomorSurat, js.namaJenisSurat, sm.pengirim, sm.uraian, sm.keterangan')
          .From('suratMasuk sm')
          .Join('jenisSurat js', 'js.IdJenisSurat = sm.IdJenisSurat')
          .Build;
  dm.qTemp.Close;
  dm.qTemp.SQL.Text := SQL;
  dm.qTemp.ExecWithDebug;

//  vTemp.Active := True;
//  vTemp.Assign(dm.qTemp);

  sgSuratMasuk.AssignData(dm.qTemp);
  sgSuratMasuk.AutoSizeColumn;

end;
procedure TfrmSuratMasuk.sbSearchChange(Sender: TObject);
begin
  if Length(sbSearch.Text) > 0 then
  begin
    sgSuratMasuk.Filter(sbSearch.Text, 4);
  end else
  begin
    sgSuratMasuk.ResetFilter;
  end;
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
