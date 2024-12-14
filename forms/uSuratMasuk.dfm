object frmSuratMasuk: TfrmSuratMasuk
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Surat Masuk'
  ClientHeight = 600
  ClientWidth = 1280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 17
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 60
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1280
      60)
    object sbSearch: TSearchBox
      Left = 96
      Top = 15
      Width = 121
      Height = 25
      TabOrder = 0
      TextHint = 'Type '
    end
    object btAdd: TButton
      Left = 1033
      Top = 15
      Width = 75
      Height = 32
      Anchors = [akTop, akRight]
      Caption = 'Tambah'
      ImageIndex = 4
      Images = dm.imlIcons16
      TabOrder = 1
      OnClick = btAddClick
    end
    object btEdit: TButton
      Left = 1113
      Top = 15
      Width = 75
      Height = 32
      Anchors = [akTop, akRight]
      Caption = 'Ubah'
      ImageIndex = 6
      Images = dm.imlIcons16
      TabOrder = 2
    end
    object btDelete: TButton
      Left = 1193
      Top = 15
      Width = 75
      Height = 32
      Anchors = [akTop, akRight]
      Caption = 'Hapus'
      ImageIndex = 8
      Images = dm.imlIcons16
      TabOrder = 3
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 60
    Width = 1280
    Height = 540
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
end
