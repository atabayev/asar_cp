object FormSelectMethod: TFormSelectMethod
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088' '#1084#1077#1090#1086#1076#1072' '#1072#1090#1072#1082#1080
  ClientHeight = 182
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 269
    Height = 182
    Align = alClient
    TabOrder = 0
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 267
      Height = 56
      Align = alTop
      Caption = #1060#1080#1096#1080#1085#1075
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 1
      Top = 57
      Width = 267
      Height = 63
      Align = alClient
      Caption = #1042#1080#1088#1091#1089
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 1
      Top = 120
      Width = 267
      Height = 61
      Align = alBottom
      Caption = #1060#1080#1096#1080#1085#1075' + '#1042#1080#1088#1091#1089
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 208
    Top = 128
  end
end
