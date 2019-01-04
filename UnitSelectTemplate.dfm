object FormSelectTemplate: TFormSelectTemplate
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088' '#1064#1072#1073#1083#1086#1085#1072
  ClientHeight = 625
  ClientWidth = 1040
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
    Left = 177
    Top = 0
    Width = 863
    Height = 548
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 600
    ExplicitWidth = 440
    ExplicitHeight = 625
    object WebBrowser: TWebBrowser
      Left = 1
      Top = 1
      Width = 861
      Height = 546
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 140
      ExplicitTop = 48
      ExplicitWidth = 300
      ExplicitHeight = 150
      ControlData = {
        4C000000FD5800006E3800000100000001020000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 177
    Height = 548
    Align = alLeft
    TabOrder = 1
    ExplicitHeight = 612
    object lbTemplates: TListBox
      Left = 1
      Top = 1
      Width = 175
      Height = 546
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnClick = lbTemplatesClick
      ExplicitLeft = 24
      ExplicitTop = 264
      ExplicitWidth = 121
      ExplicitHeight = 97
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 548
    Width = 1040
    Height = 77
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 519
      Height = 75
      Align = alClient
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = -5
      ExplicitTop = 5
    end
    object Button2: TButton
      Left = 520
      Top = 1
      Width = 519
      Height = 75
      Align = alRight
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
      ExplicitTop = 5
    end
  end
end
