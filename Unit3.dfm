object FormAddEmails: TFormAddEmails
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1072#1090#1072#1082#1080
  ClientHeight = 743
  ClientWidth = 1384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1384
    Height = 668
    Align = alClient
    TabOrder = 0
    object lvQueue: TListView
      Left = 289
      Top = 1
      Width = 1094
      Height = 666
      Align = alClient
      Columns = <>
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object pCategory: TPanel
      Left = 1
      Top = 1
      Width = 288
      Height = 666
      Align = alLeft
      TabOrder = 1
      object CategoryPanelGroup1: TCategoryPanelGroup
        Left = 1
        Top = 1
        Width = 286
        Height = 553
        VertScrollBar.Position = 333
        VertScrollBar.Tracking = True
        Align = alClient
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        TabOrder = 0
        object CategoryPanel4: TCategoryPanel
          Top = 357
          Height = 194
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1093#1086#1089#1090#1080#1085#1075#1072
          TabOrder = 0
          object Label14: TLabel
            Left = 16
            Top = 3
            Width = 54
            Height = 19
            Caption = #1057#1077#1088#1074#1077#1088':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 16
            Top = 53
            Width = 102
            Height = 19
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 16
            Top = 103
            Width = 52
            Height = 19
            Caption = #1055#1072#1088#1086#1083#1100':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object edFtpHost: TEdit
            Left = 9
            Top = 23
            Width = 241
            Height = 27
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object edFtpUser: TEdit
            Left = 9
            Top = 70
            Width = 241
            Height = 27
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object edFtpPswd: TEdit
            Left = 9
            Top = 123
            Width = 241
            Height = 27
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
        object CategoryPanel3: TCategoryPanel
          Top = 114
          Height = 243
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
          TabOrder = 1
          object Label12: TLabel
            Left = 16
            Top = 6
            Width = 68
            Height = 19
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 16
            Top = 104
            Width = 102
            Height = 19
            Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object mmDescription: TMemo
            Left = 9
            Top = 26
            Width = 241
            Height = 74
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Candara Light'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object mmComment: TMemo
            Left = 9
            Top = 129
            Width = 241
            Height = 74
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Candara Light'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object CategoryPanel2: TCategoryPanel
          Top = -184
          Height = 298
          BiDiMode = bdLeftToRight
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1080#1089#1100#1084#1072
          DoubleBuffered = False
          ParentBiDiMode = False
          ParentDoubleBuffered = False
          TabOrder = 2
          object Label7: TLabel
            Left = 16
            Top = 4
            Width = 49
            Height = 19
            Caption = #1055#1086#1095#1090#1072':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 16
            Top = 56
            Width = 53
            Height = 19
            Caption = #1052#1077#1090#1086#1076':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 16
            Top = 109
            Width = 87
            Height = 19
            Caption = #1058#1077#1084#1072' '#1087#1080#1089#1100#1084#1072':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 16
            Top = 160
            Width = 56
            Height = 19
            Caption = #1057#1090#1088#1072#1085#1072':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 16
            Top = 212
            Width = 57
            Height = 19
            Caption = #1064#1072#1073#1083#1086#1085':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object edEmail: TEdit
            Left = 9
            Top = 24
            Width = 241
            Height = 27
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cbMethod: TComboBox
            Left = 9
            Top = 76
            Width = 241
            Height = 27
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            TabOrder = 1
            Text = #1060#1080#1096#1080#1085#1075
            Items.Strings = (
              #1060#1080#1096#1080#1085#1075
              #1042#1080#1088#1091#1089
              #1042#1080#1088#1091#1089' + '#1060#1080#1096#1080#1085#1075)
          end
          object edSubject: TEdit
            Left = 9
            Top = 129
            Width = 241
            Height = 27
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object edCounytry: TEdit
            Left = 9
            Top = 179
            Width = 241
            Height = 27
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object btnSelectTemplate: TButton
            Left = 223
            Top = 232
            Width = 27
            Height = 27
            Caption = '...'
            TabOrder = 4
            OnClick = btnSelectTemplateClick
          end
          object edTemplate: TEdit
            Left = 9
            Top = 232
            Width = 208
            Height = 27
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
        end
        object CategoryPanel1: TCategoryPanel
          Top = -333
          Height = 149
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
          TabOrder = 3
          object Label4: TLabel
            Left = 16
            Top = 5
            Width = 150
            Height = 19
            Caption = #1055#1086#1095#1090#1072' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 16
            Top = 59
            Width = 226
            Height = 19
            Caption = #1055#1072#1088#1086#1083#1100' '#1086#1090' '#1087#1086#1095#1090#1099' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object edSendersEmail: TEdit
            Left = 9
            Top = 25
            Width = 241
            Height = 27
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object edSendersEmPswd: TEdit
            Left = 9
            Top = 79
            Width = 241
            Height = 27
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Candara'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object Panel3: TPanel
        Left = 1
        Top = 594
        Width = 286
        Height = 71
        Align = alBottom
        TabOrder = 1
        object Button3: TButton
          Left = 1
          Top = 1
          Width = 284
          Height = 54
          Align = alClient
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089' '#1092#1072#1081#1083#1072' [ ]'
          Enabled = False
          TabOrder = 0
          OnClick = Button3Click
        end
        object Panel4: TPanel
          Left = 1
          Top = 55
          Width = 284
          Height = 15
          Align = alBottom
          TabOrder = 1
        end
      end
      object Button2: TButton
        Left = 1
        Top = 554
        Width = 286
        Height = 40
        Align = alBottom
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' ->'
        TabOrder = 2
        OnClick = Button2Click
      end
    end
  end
  object btnAddToStack: TButton
    Left = 0
    Top = 668
    Width = 1384
    Height = 75
    Align = alBottom
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1086#1095#1077#1088#1077#1076#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnAddToStackClick
  end
  object OpenDialog1: TOpenDialog
    Left = 777
    Top = 296
  end
end
