object frmSuratKeluar: TfrmSuratKeluar
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Surat Keluar'
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
  OnShow = FormShow
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
      Left = 978
      Top = 17
      Width = 193
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      TextHint = 'Type '
      OnChange = sbSearchChange
    end
    object btAdd: TButton
      Left = 1177
      Top = 15
      Width = 75
      Height = 30
      Anchors = [akTop, akRight]
      Caption = 'Baru'
      ImageIndex = 4
      Images = dm.imlIcons16
      TabOrder = 1
      OnClick = btAddClick
    end
  end
  object sgSuratMasuk: TStringGrid
    AlignWithMargins = True
    Left = 3
    Top = 63
    Width = 1274
    Height = 534
    Align = alClient
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = option
    TabOrder = 1
  end
  object option: TPopupMenu
    Left = 968
    Top = 304
    object Ubah1: TMenuItem
      Caption = 'Ubah'
      OnClick = Ubah1Click
    end
  end
end
