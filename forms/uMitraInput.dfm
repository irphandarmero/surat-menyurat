object frmMitraInput: TfrmMitraInput
  Left = 0
  Top = 0
  Caption = 'Input Data Mitra'
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
  object Label1: TLabel
    Left = 24
    Top = 59
    Width = 35
    Height = 17
    Caption = 'Nama'
  end
  object Label2: TLabel
    Left = 24
    Top = 90
    Width = 40
    Height = 17
    Caption = 'Alamat'
  end
  object Label3: TLabel
    Left = 24
    Top = 216
    Width = 62
    Height = 17
    Caption = 'Nomor HP'
  end
  object Label4: TLabel
    Left = 24
    Top = 185
    Width = 88
    Height = 17
    Caption = 'Contact Person'
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 216
    ExplicitTop = 200
    ExplicitWidth = 185
  end
  object pnBottom: TPanel
    Left = 0
    Top = 359
    Width = 600
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 185
    object btSave: TButton
      Left = 220
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = btSaveClick
    end
    object btCancel: TButton
      Left = 305
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 1
    end
  end
  object edNamaMitra: TEdit
    Left = 165
    Top = 56
    Width = 356
    Height = 25
    TabOrder = 2
    TextHint = 'Nama Perusahaan / Mitra'
  end
  object mmAlamat: TMemo
    Left = 165
    Top = 87
    Width = 356
    Height = 89
    TabOrder = 3
  end
  object edCP: TEdit
    Left = 165
    Top = 182
    Width = 356
    Height = 25
    TabOrder = 4
    TextHint = 'Nama PIC'
  end
  object edNoHP: TEdit
    Left = 165
    Top = 213
    Width = 356
    Height = 25
    TabOrder = 5
    TextHint = 'Nomor HP / Whatsapp'
  end
end
