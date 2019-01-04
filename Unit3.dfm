object FormAddEmails: TFormAddEmails
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1072#1090#1072#1082#1080
  ClientHeight = 698
  ClientWidth = 1124
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
    Left = 297
    Top = 0
    Width = 827
    Height = 623
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 209
    ExplicitWidth = 462
    ExplicitHeight = 551
    object lvQueue: TListView
      Left = 1
      Top = 1
      Width = 825
      Height = 621
      Align = alClient
      Columns = <>
      TabOrder = 0
      ViewStyle = vsReport
      ExplicitLeft = 5
      ExplicitWidth = 709
    end
    object tmpMemo: TMemo
      Left = 48
      Top = 496
      Width = 185
      Height = 89
      TabOrder = 1
      Visible = False
    end
  end
  object btnAddToStack: TButton
    Left = 0
    Top = 623
    Width = 1124
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
    ExplicitTop = 627
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 623
    Align = alLeft
    TabOrder = 2
    object Label6: TLabel
      Left = 21
      Top = 441
      Width = 64
      Height = 23
      Caption = #1064#1072#1073#1083#1086#1085':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 21
      Top = 335
      Width = 81
      Height = 23
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Button2: TButton
      Left = 1
      Top = 511
      Width = 295
      Height = 40
      Align = alBottom
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' ->'
      TabOrder = 0
      OnClick = Button2Click
      ExplicitTop = 512
    end
    object Panel3: TPanel
      Left = 1
      Top = 551
      Width = 295
      Height = 71
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 479
      ExplicitWidth = 207
      object Button3: TButton
        Left = 1
        Top = 15
        Width = 293
        Height = 40
        Align = alClient
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089' '#1092#1072#1081#1083#1072' [ ]'
        Enabled = False
        TabOrder = 0
        OnClick = Button3Click
        ExplicitTop = 19
        ExplicitHeight = 31
      end
      object Panel4: TPanel
        Left = 1
        Top = 55
        Width = 293
        Height = 15
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 56
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 293
        Height = 14
        Align = alTop
        TabOrder = 2
      end
    end
    object cbTemplate: TComboBox
      Left = 19
      Top = 466
      Width = 220
      Height = 31
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object btnSelectTemplate: TButton
      Left = 245
      Top = 466
      Width = 34
      Height = 31
      Caption = '...'
      TabOrder = 3
      OnClick = btnSelectTemplateClick
    end
    object ledEmail: TLabeledEdit
      Left = 19
      Top = 35
      Width = 260
      Height = 31
      EditLabel.Width = 54
      EditLabel.Height = 23
      EditLabel.Caption = #1055#1086#1095#1090#1072':'
      EditLabel.Font.Charset = RUSSIAN_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Comic Sans MS'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object ledSendersEmail: TLabeledEdit
      Left = 19
      Top = 100
      Width = 260
      Height = 31
      EditLabel.Width = 155
      EditLabel.Height = 23
      EditLabel.Caption = #1055#1086#1095#1090#1072' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103':'
      EditLabel.Font.Charset = RUSSIAN_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Comic Sans MS'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object ledSendersEmPswd: TLabeledEdit
      Left = 19
      Top = 165
      Width = 260
      Height = 31
      EditLabel.Width = 241
      EditLabel.Height = 23
      EditLabel.Caption = #1055#1072#1088#1086#1083#1100' '#1086#1090' '#1087#1086#1095#1090#1099' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103':'
      EditLabel.Font.Charset = RUSSIAN_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Comic Sans MS'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object ledSubject: TLabeledEdit
      Left = 19
      Top = 230
      Width = 260
      Height = 31
      EditLabel.Width = 105
      EditLabel.Height = 23
      EditLabel.Caption = #1058#1077#1084#1072' '#1087#1080#1089#1100#1084#1072':'
      EditLabel.Font.Charset = RUSSIAN_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Comic Sans MS'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object ledCounytry: TLabeledEdit
      Left = 19
      Top = 295
      Width = 260
      Height = 31
      EditLabel.Width = 57
      EditLabel.Height = 23
      EditLabel.Caption = #1057#1090#1088#1072#1085#1072':'
      EditLabel.Font.Charset = RUSSIAN_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Comic Sans MS'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object mmDescription: TMemo
      Left = 19
      Top = 360
      Width = 260
      Height = 73
      TabOrder = 9
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 345
    Top = 296
  end
end
