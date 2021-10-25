object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 450
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 32
    Top = 40
    Width = 313
    Height = 138
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object lblCurrentTemp: TLabel
      Left = 151
      Top = 8
      Width = 32
      Height = 35
      Caption = '00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCondition: TLabel
      Left = 151
      Top = 49
      Width = 55
      Height = 13
      Caption = 'lblCondition'
    end
    object lblTemperatureSensation: TLabel
      Left = 191
      Top = 16
      Width = 20
      Height = 23
      Caption = '00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDateTime: TLabel
      Left = 249
      Top = 102
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'lblDateTime'
    end
    object imgIcon: TImage
      Left = 10
      Top = 5
      Width = 128
      Height = 128
    end
  end
  object Button1: TButton
    Left = 270
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object rgSource: TRadioGroup
    Left = 32
    Top = 215
    Width = 185
    Height = 201
    Caption = 'rgSource'
    Enabled = False
    ItemIndex = 3
    Items.Strings = (
      'Mocky'
      'Local Database'
      'Local API'
      'Rest - ClimaTempo'
      'Rest - HG')
    TabOrder = 2
  end
  object statusbar: TStatusBar
    Left = 0
    Top = 431
    Width = 688
    Height = 19
    Panels = <
      item
        Text = '00'#186
        Width = 50
      end>
  end
end
