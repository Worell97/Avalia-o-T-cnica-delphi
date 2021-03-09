object FCadastroAluno: TFCadastroAluno
  Left = 0
  Top = 0
  Caption = 'Cadastro de alunos'
  ClientHeight = 197
  ClientWidth = 604
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
  object LblID: TLabel
    Left = 85
    Top = 16
    Width = 15
    Height = 13
    Caption = 'ID:'
  end
  object Label2: TLabel
    Left = 69
    Top = 40
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 77
    Top = 64
    Width = 23
    Height = 13
    Caption = 'CPF:'
  end
  object Label4: TLabel
    Left = 76
    Top = 88
    Width = 24
    Height = 13
    Caption = 'Sexo'
  end
  object Label5: TLabel
    Left = 16
    Top = 114
    Width = 84
    Height = 13
    Caption = 'Data nascimento:'
  end
  object Label6: TLabel
    Left = 72
    Top = 139
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  object Label7: TLabel
    Left = 76
    Top = 164
    Width = 24
    Height = 13
    Caption = 'S'#233'rie'
  end
  object MeCPF: TMaskEdit
    Left = 106
    Top = 61
    Width = 82
    Height = 21
    Enabled = False
    EditMask = '!999.999.999-99;1; '
    MaxLength = 14
    TabOrder = 2
    Text = '   .   .   -  '
  end
  object MeNome: TMaskEdit
    Left = 106
    Top = 37
    Width = 206
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = ''
  end
  object MeSexo: TMaskEdit
    Left = 106
    Top = 85
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 3
    Text = ''
  end
  object MeDataNascimento: TMaskEdit
    Left = 106
    Top = 111
    Width = 74
    Height = 21
    Enabled = False
    EditMask = '!99/99/9999;1; '
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
  end
  object MeEmail: TMaskEdit
    Left = 106
    Top = 136
    Width = 206
    Height = 21
    Enabled = False
    TabOrder = 5
    Text = ''
  end
  object BtnConfirmar: TButton
    Left = 328
    Top = 16
    Width = 161
    Height = 64
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = BtnConfirmarClick
  end
  object BtnExcluir: TButton
    Left = 328
    Top = 93
    Width = 161
    Height = 64
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = BtnExcluirClick
  end
  object EdtId: TEdit
    Left = 106
    Top = 13
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    OnExit = EdtIdExit
  end
  object EdtSerie: TEdit
    Left = 106
    Top = 161
    Width = 121
    Height = 21
    MaxLength = 1
    NumbersOnly = True
    TabOrder = 6
  end
end
