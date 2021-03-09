object FCadastroNotas: TFCadastroNotas
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 189
  ClientWidth = 246
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
  object pnlAlunoNotas: TPanel
    Left = 0
    Top = 0
    Width = 246
    Height = 189
    Align = alClient
    TabOrder = 0
    object lblAlunoID: TLabel
      Left = 16
      Top = 16
      Width = 82
      Height = 13
      Caption = 'C'#243'digo do Aluno:'
    end
    object lblNota1: TLabel
      Left = 16
      Top = 43
      Width = 64
      Height = 13
      Caption = 'Nota 1'#176' Bim.:'
    end
    object lblNota2: TLabel
      Left = 16
      Top = 70
      Width = 64
      Height = 13
      Caption = 'Nota 2'#176' Bim.:'
    end
    object lblNota4: TLabel
      Left = 16
      Top = 124
      Width = 64
      Height = 13
      Caption = 'Nota 4'#176' Bim.:'
    end
    object Label3: TLabel
      Left = 16
      Top = 97
      Width = 64
      Height = 13
      Caption = 'Nota 3'#176' Bim.:'
    end
    object EdtAluno: TEdit
      Left = 100
      Top = 13
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 0
    end
    object EdtNota1: TEdit
      Left = 100
      Top = 40
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
    object EdtNota2: TEdit
      Left = 100
      Top = 67
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 2
    end
    object EdtNota4: TEdit
      Left = 100
      Top = 121
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 4
    end
    object EdtNota3: TEdit
      Left = 100
      Top = 94
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 3
    end
    object btnComfirmar: TButton
      Left = 146
      Top = 148
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 5
      OnClick = btnComfirmarClick
    end
  end
end
