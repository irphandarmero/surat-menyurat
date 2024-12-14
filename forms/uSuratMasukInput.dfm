object frmSuratMasukInput: TfrmSuratMasukInput
  Left = 0
  Top = 0
  Caption = 'Input Data'
  ClientHeight = 322
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbTanggalSurat: TLabel
    Left = 56
    Top = 56
    Width = 41
    Height = 13
    Caption = 'Tanggal'
  end
  object lbNomorSurat: TLabel
    Left = 56
    Top = 75
    Width = 65
    Height = 13
    Caption = 'Nomor Surat'
  end
  object lbPengirim: TLabel
    Left = 56
    Top = 105
    Width = 45
    Height = 13
    Caption = 'Pengirim'
  end
  object lbKeterangan: TLabel
    Left = 56
    Top = 132
    Width = 59
    Height = 13
    Caption = 'Keterangan'
  end
  object dtTanggalSurat: TDateTimePicker
    Left = 168
    Top = 48
    Width = 186
    Height = 21
    Date = 45589.000000000000000000
    Time = 0.404146377317374600
    TabOrder = 0
  end
  object edNomorSurat: TEdit
    Left = 168
    Top = 75
    Width = 121
    Height = 21
    TabOrder = 1
    TextHint = 'Nomor Surat'
  end
  object edPengirim: TEdit
    Left = 168
    Top = 102
    Width = 121
    Height = 21
    TabOrder = 2
    TextHint = 'Pengirim'
  end
  object btSave: TButton
    Left = 168
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
  end
  object btCancel: TButton
    Left = 249
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 4
  end
  object edKeterangan: TEdit
    Left = 168
    Top = 129
    Width = 121
    Height = 21
    TabOrder = 5
    TextHint = 'Keterangan'
  end
end
