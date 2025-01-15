object frmMitra: TfrmMitra
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Mitra Kerjasama'
  ClientHeight = 610
  ClientWidth = 1290
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
    Width = 1290
    Height = 60
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1280
    DesignSize = (
      1290
      60)
    object sbSearch: TSearchBox
      Left = 978
      Top = 17
      Width = 193
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      TextHint = 'Type '
    end
    object btAdd: TButton
      Left = 1177
      Top = 14
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
  object sgMitra: TStringGrid
    Left = 0
    Top = 60
    Width = 1290
    Height = 550
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 488
    ExplicitTop = 256
    ExplicitWidth = 320
    ExplicitHeight = 120
  end
end
