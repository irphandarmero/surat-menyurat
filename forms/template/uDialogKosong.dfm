object frmTemplateDialog: TfrmTemplateDialog
  Left = 0
  Top = 0
  Caption = 'Dialog Mitra'
  ClientHeight = 400
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnBottom: TPanel
    Left = 0
    Top = 359
    Width = 600
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btOk: TButton
      Left = 224
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btOkClick
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
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 41
    Align = alTop
    TabOrder = 1
    object btBaru: TButton
      Left = 522
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Baru'
      TabOrder = 0
      OnClick = btBaruClick
    end
  end
  object sgDialog: TStringGrid
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 594
    Height = 312
    Align = alClient
    TabOrder = 2
  end
end
