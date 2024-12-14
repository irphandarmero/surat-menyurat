object frmQueryDebugger: TfrmQueryDebugger
  Left = 0
  Top = 0
  Caption = 'frmQueryDebugger'
  ClientHeight = 411
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 30
    Height = 13
    Caption = 'Query'
  end
  object Label2: TLabel
    Left = 8
    Top = 216
    Width = 42
    Height = 13
    Caption = 'Message'
  end
  object mmQuery: TMemo
    Left = 8
    Top = 35
    Width = 433
    Height = 134
    Lines.Strings = (
      'mmQuery')
    TabOrder = 0
  end
  object btnCopyQuery: TButton
    Left = 280
    Top = 175
    Width = 161
    Height = 25
    Caption = 'Copy Query to Clipboard'
    TabOrder = 1
    OnClick = btnCopyQueryClick
  end
  object btnCopyMessage: TButton
    Left = 280
    Top = 375
    Width = 161
    Height = 25
    Caption = 'Copy Message to Clipboard'
    TabOrder = 2
    OnClick = btnCopyMessageClick
  end
  object mmMessage: TMemo
    Left = 8
    Top = 235
    Width = 433
    Height = 134
    Lines.Strings = (
      'mmQuery')
    TabOrder = 3
  end
  object btnClose: TButton
    Left = 8
    Top = 375
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 4
    OnClick = btnCloseClick
  end
end
