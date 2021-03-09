object FCadastroProfessor: TFCadastroProfessor
  Left = 0
  Top = 0
  Caption = 'Cadastro de professores'
  ClientHeight = 437
  ClientWidth = 545
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
  object pnlAlunos: TPanel
    Left = 0
    Top = 137
    Width = 545
    Height = 259
    Align = alClient
    Caption = 'pnlAlunos'
    TabOrder = 1
    DesignSize = (
      545
      259)
    object Label1: TLabel
      Left = -1
      Top = -4
      Width = 85
      Height = 35
      Caption = 'Alunos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 29
      Width = 535
      Height = 193
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dtsDadosAlunos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Button1: TButton
      Left = 350
      Top = 228
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Adicionar Aluno'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 447
      Top = 228
      Width = 88
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Remover Aluno'
      TabOrder = 2
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 396
    Width = 545
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BtnConfirmar: TButton
      Left = 226
      Top = 1
      Width = 159
      Height = 39
      Align = alRight
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnConfirmarClick
    end
    object BtnExcluir: TButton
      Left = 385
      Top = 1
      Width = 159
      Height = 39
      Align = alRight
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnExcluirClick
    end
  end
  object pnlProfessor: TPanel
    Left = 0
    Top = 0
    Width = 545
    Height = 137
    Align = alTop
    TabOrder = 0
    object LblDiciplina: TLabel
      Left = 325
      Top = 78
      Width = 42
      Height = 13
      Caption = 'Diciplina:'
    end
    object LblEmail: TLabel
      Left = 7
      Top = 104
      Width = 32
      Height = 13
      Caption = 'E-mail:'
    end
    object LblID: TLabel
      Left = 4
      Top = 52
      Width = 15
      Height = 13
      Caption = 'ID:'
    end
    object LblNome: TLabel
      Left = 158
      Top = 52
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 118
      Height = 35
      Caption = 'Professor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblCPF: TLabel
      Left = 403
      Top = 52
      Width = 23
      Height = 13
      Caption = 'CPF:'
    end
    object LblSexo: TLabel
      Left = 3
      Top = 78
      Width = 28
      Height = 13
      Caption = 'Sexo:'
    end
    object Label5: TLabel
      Left = 161
      Top = 78
      Width = 84
      Height = 13
      Caption = 'Data nascimento:'
    end
    object EdtId: TEdit
      Left = 25
      Top = 49
      Width = 117
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      Text = '0'
      OnExit = EdtIdExit
    end
    object MeDiciplina: TMaskEdit
      Left = 369
      Top = 75
      Width = 136
      Height = 21
      Enabled = False
      TabOrder = 5
      Text = ''
    end
    object MeEmail: TMaskEdit
      Left = 41
      Top = 101
      Width = 189
      Height = 21
      Enabled = False
      TabOrder = 6
      Text = ''
    end
    object MeNome: TMaskEdit
      Left = 195
      Top = 49
      Width = 188
      Height = 21
      Enabled = False
      TabOrder = 1
      Text = ''
    end
    object MeCPF: TMaskEdit
      Left = 432
      Top = 49
      Width = 73
      Height = 21
      Enabled = False
      EditMask = '!999.999.999-99;1; '
      MaxLength = 14
      TabOrder = 2
      Text = '   .   .   -  '
    end
    object MeSexo: TMaskEdit
      Left = 33
      Top = 75
      Width = 118
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = ''
    end
    object MeDataNascimento: TMaskEdit
      Left = 251
      Top = 75
      Width = 64
      Height = 21
      Enabled = False
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
    end
  end
  object dspDadosALunos: TDataSetProvider
    DataSet = tblAlunos
    Left = 144
    Top = 264
  end
  object cdsDadosAlunos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDadosALunos'
    Left = 224
    Top = 264
  end
  object dtsDadosAlunos: TDataSource
    DataSet = cdsDadosAlunos
    Left = 272
    Top = 264
  end
  object ConnectionAlunos: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    Left = 24
    Top = 265
  end
  object tblAlunos: TFDTable
    Connection = ConnectionAlunos
    Left = 80
    Top = 265
  end
end
