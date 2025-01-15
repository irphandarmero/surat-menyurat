object frmSuratMasukInput: TfrmSuratMasukInput
  Left = 0
  Top = 0
  Caption = 'Input Data'
  ClientHeight = 400
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 17
  object lbTanggalSurat: TLabel
    Left = 24
    Top = 90
    Width = 46
    Height = 17
    Caption = 'Tanggal'
  end
  object lbNomorSurat: TLabel
    Left = 24
    Top = 121
    Width = 76
    Height = 17
    Caption = 'Nomor Surat'
  end
  object lbPengirim: TLabel
    Left = 24
    Top = 152
    Width = 51
    Height = 17
    Caption = 'Pengirim'
  end
  object lbKeterangan: TLabel
    Left = 24
    Top = 247
    Width = 67
    Height = 17
    Caption = 'Keterangan'
  end
  object Label1: TLabel
    Left = 24
    Top = 59
    Width = 62
    Height = 17
    Caption = 'Jenis Surat'
  end
  object Label2: TLabel
    Left = 24
    Top = 183
    Width = 46
    Height = 17
    Caption = 'Isi Surat'
  end
  object dtTanggalSurat: TDateTimePicker
    Left = 165
    Top = 87
    Width = 186
    Height = 25
    Date = 45589.000000000000000000
    Time = 0.404146377317374600
    TabOrder = 0
  end
  object edNomorSurat: TEdit
    Left = 165
    Top = 118
    Width = 313
    Height = 25
    TabOrder = 1
    TextHint = 'Nomor Surat'
  end
  object edPengirim: TEdit
    Left = 165
    Top = 149
    Width = 313
    Height = 25
    TabOrder = 2
    TextHint = 'Pengirim'
  end
  object edKeterangan: TEdit
    Left = 165
    Top = 244
    Width = 312
    Height = 25
    TabOrder = 3
    TextHint = 'Keterangan'
  end
  object mmUraian: TMemo
    Left = 165
    Top = 180
    Width = 312
    Height = 58
    TabOrder = 4
  end
  object btJenisSurat: TButton
    Left = 487
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Jenis Surat'
    TabOrder = 5
    OnClick = btJenisSuratClick
  end
  object pnButtom: TPanel
    Left = 0
    Top = 359
    Width = 600
    Height = 41
    Align = alBottom
    TabOrder = 6
    object btCancel: TButton
      Left = 305
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 0
    end
    object btSave: TButton
      Left = 220
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 1
      OnClick = btSaveClick
    end
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 41
    Align = alTop
    TabOrder = 7
  end
  object edJenisSurat: TEdit
    Left = 165
    Top = 56
    Width = 313
    Height = 25
    TabOrder = 8
    TextHint = 'Jenis Surat'
  end
  object btMitra: TButton
    Left = 484
    Top = 149
    Width = 75
    Height = 25
    Caption = 'Mitra'
    TabOrder = 9
  end
end
