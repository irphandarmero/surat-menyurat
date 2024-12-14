object frmUtama: TfrmUtama
  Left = 0
  Top = 0
  Caption = 'SISM (Sistem Informasi Surat Menyurat)'
  ClientHeight = 729
  ClientWidth = 1264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 17
  object pnContent: TPanel
    Left = 250
    Top = 41
    Width = 1014
    Height = 688
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object pcMain: TPageControl
      Left = 0
      Top = 0
      Width = 1014
      Height = 688
      Align = alClient
      TabOrder = 0
      OnMouseDown = pcMainMouseDown
    end
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1264
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object imgMenu: TImage
      Left = 0
      Top = 0
      Width = 57
      Height = 41
      Cursor = crHandPoint
      Align = alLeft
      Center = True
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
        0000001008060000001FF3FF6100000009704859730000007600000076014E7B
        26080000001974455874536F667477617265007777772E696E6B73636170652E
        6F72679BEE3C1A0000004B49444154388DCDD2B10980401843E1EF5CC3C6391C
        D109CFCE42E7D0C20DF20BDE83940F42087FD3B0620EFD0B3AEE303DEF3E0C0D
        1B96D03F26EF182915772476852355AF7C569A7FC3034D9625466B5A2D040000
        000049454E44AE426082}
      OnClick = imgMenuClick
    end
  end
  object SV: TSplitView
    Left = 0
    Top = 41
    Width = 250
    Height = 688
    Color = clWhite
    OpenedWidth = 250
    Placement = svpLeft
    TabOrder = 2
    object catMenuItems: TCategoryButtons
      Left = 0
      Top = 0
      Width = 250
      Height = 560
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ButtonFlow = cbfVertical
      ButtonHeight = 40
      ButtonWidth = 100
      ButtonOptions = [boFullSize, boGradientFill, boShowCaptions, boUsePlusMinus]
      Categories = <
        item
          Caption = 'Menu'
          Color = clWhite
          Collapsed = False
          Items = <
            item
              Action = dm.actSuratMasuk
            end
            item
              Action = dm.actSuratKeluar
            end>
        end
        item
          Caption = 'Master'
          Color = clWhite
          Collapsed = False
          Items = <
            item
              Action = dm.actUsers
            end
            item
              Action = dm.actMitra
            end
            item
              Action = dm.actJenisSurat
            end>
        end>
      HotButtonColor = clBtnFace
      Images = dm.imlIcons16
      RegularButtonColor = clNone
      SelectedButtonColor = clNone
      TabOrder = 0
    end
    object catMenuBottom: TCategoryButtons
      Left = 0
      Top = 560
      Width = 250
      Height = 128
      Align = alBottom
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ButtonFlow = cbfVertical
      ButtonHeight = 40
      ButtonWidth = 100
      ButtonOptions = [boFullSize, boGradientFill, boShowCaptions, boUsePlusMinus, boCaptionOnlyBorder]
      Categories = <
        item
          Color = clNone
          Collapsed = False
          Items = <
            item
              Action = dm.actSetting
            end
            item
              Action = dm.actLogout
            end>
        end>
      HotButtonColor = clBtnFace
      Images = dm.imlIcons16
      RegularButtonColor = clNone
      SelectedButtonColor = clNone
      TabOrder = 1
    end
  end
end
