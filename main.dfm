object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastros'
  ClientHeight = 237
  ClientWidth = 413
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
  object BtnAluno: TButton
    Left = 48
    Top = 40
    Width = 316
    Height = 73
    Caption = 'Cadastrar Alunos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BtnAlunoClick
  end
  object BtnProfessor: TButton
    Left = 48
    Top = 127
    Width = 316
    Height = 73
    Caption = 'Cadastrar Professores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BtnProfessorClick
  end
end
