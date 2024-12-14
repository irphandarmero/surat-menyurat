object frmSetting: TfrmSetting
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'SETTING'
  ClientHeight = 502
  ClientWidth = 844
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcSetting: TPageControl
    Left = 0
    Top = 41
    Width = 844
    Height = 461
    ActivePage = TabDBSetting
    Align = alClient
    MultiLine = True
    TabOrder = 0
    TabPosition = tpLeft
    OnChange = pcSettingChange
    object TabDBSetting: TTabSheet
      Caption = 'Database Setting'
      object GroupBox1: TGroupBox
        Left = 14
        Top = 12
        Width = 387
        Height = 213
        Caption = 'Database Connection'
        TabOrder = 0
        object Label1: TLabel
          Left = 20
          Top = 27
          Width = 62
          Height = 13
          Caption = 'Server Name'
        end
        object Label2: TLabel
          Left = 20
          Top = 56
          Width = 76
          Height = 13
          Caption = 'Database Name'
        end
        object Label3: TLabel
          Left = 20
          Top = 85
          Width = 48
          Height = 13
          Caption = 'Username'
        end
        object Label4: TLabel
          Left = 20
          Top = 114
          Width = 46
          Height = 13
          Caption = 'Password'
        end
        object Label5: TLabel
          Left = 20
          Top = 143
          Width = 20
          Height = 13
          Caption = 'Port'
        end
        object edServerName: TEdit
          Left = 109
          Top = 24
          Width = 260
          Height = 21
          TabOrder = 0
        end
        object edDatabaseName: TEdit
          Left = 109
          Top = 53
          Width = 260
          Height = 21
          TabOrder = 1
        end
        object edDBUsername: TEdit
          Left = 109
          Top = 82
          Width = 260
          Height = 21
          TabOrder = 2
        end
        object edDBPassword: TEdit
          Left = 109
          Top = 111
          Width = 260
          Height = 21
          TabOrder = 3
        end
        object btDBSimpan: TButton
          Left = 294
          Top = 167
          Width = 75
          Height = 25
          Caption = 'Simpan'
          TabOrder = 4
          OnClick = btDBSimpanClick
        end
        object btDBTest: TButton
          Left = 213
          Top = 167
          Width = 75
          Height = 25
          Caption = 'Test'
          TabOrder = 5
          OnClick = btDBTestClick
        end
        object edDBPort: TEdit
          Left = 109
          Top = 140
          Width = 260
          Height = 21
          TabOrder = 6
          Text = '3306'
        end
      end
    end
    object TabLayoutSetting: TTabSheet
      Caption = 'Layout Setting'
      ImageIndex = 1
      object lblVclStyle: TLabel
        Left = 242
        Top = 139
        Width = 45
        Height = 13
        Caption = 'VCL Style'
      end
      object cbxVclStyles: TComboBox
        Left = 242
        Top = 158
        Width = 205
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = cbxVclStylesChange
      end
      object chkCloseOnMenuClick: TCheckBox
        Left = 242
        Top = 202
        Width = 161
        Height = 17
        Caption = 'Close on Menu Click'
        TabOrder = 1
      end
      object grpAnimation: TGroupBox
        Left = 20
        Top = 80
        Width = 205
        Height = 193
        Caption = 'Animation'
        TabOrder = 2
        object lblAnimationDelay: TLabel
          Left = 16
          Top = 56
          Width = 100
          Height = 13
          Caption = 'Animation Delay (15)'
        end
        object lblAnimationStep: TLabel
          Left = 16
          Top = 123
          Width = 95
          Height = 13
          Caption = 'Animation Step (20)'
        end
        object chkUseAnimation: TCheckBox
          Left = 16
          Top = 24
          Width = 97
          Height = 17
          Caption = 'Use Animation'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkUseAnimationClick
        end
        object trkAnimationDelay: TTrackBar
          Left = 8
          Top = 77
          Width = 177
          Height = 36
          Max = 15
          Min = 1
          Position = 3
          TabOrder = 1
          OnChange = trkAnimationDelayChange
        end
        object trkAnimationStep: TTrackBar
          Left = 8
          Top = 144
          Width = 177
          Height = 33
          Max = 15
          Min = 1
          Position = 4
          TabOrder = 2
          OnChange = trkAnimationStepChange
        end
      end
      object grpCloseStyle: TRadioGroup
        Left = 20
        Top = 12
        Width = 205
        Height = 53
        Caption = 'Close Style'
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Collapse'
          'Compact')
        TabOrder = 3
        OnClick = grpCloseStyleClick
      end
      object grpDisplayMode: TRadioGroup
        Left = 242
        Top = 12
        Width = 205
        Height = 53
        Caption = 'Display Mode'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Docked'
          'Overlay')
        TabOrder = 4
        OnClick = grpDisplayModeClick
      end
      object grpPlacement: TRadioGroup
        Left = 242
        Top = 80
        Width = 205
        Height = 53
        Caption = 'Placement'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Left'
          'Right')
        TabOrder = 5
        OnClick = grpPlacementClick
      end
      object btLOSimpan: TButton
        Left = 372
        Top = 248
        Width = 75
        Height = 25
        Caption = 'Simpan'
        TabOrder = 6
        OnClick = btLOSimpanClick
      end
    end
    object TabLog: TTabSheet
      Caption = 'Change Log'
      ImageIndex = 2
      object lblLog: TLabel
        Left = 12
        Top = 16
        Width = 17
        Height = 13
        Caption = 'Log'
      end
      object lstLog: TListBox
        Left = 50
        Top = 16
        Width = 439
        Height = 233
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
  end
end
