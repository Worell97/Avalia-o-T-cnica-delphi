unit cadastroAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, FireDAC.Comp.Client, DAO.Cad_Alunos, DTO.Cad_Alunos,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.DApt;

type
  TFCadastroAluno = class(TForm)
    LblID: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MeCPF: TMaskEdit;
    MeNome: TMaskEdit;
    MeSexo: TMaskEdit;
    MeDataNascimento: TMaskEdit;
    MeEmail: TMaskEdit;
    BtnConfirmar: TButton;
    BtnExcluir: TButton;
    EdtId: TEdit;
    EdtSerie: TEdit;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtIdExit(Sender: TObject);
  private
    FDConnection: TFDConnection;
    procedure AtivarCampos();
    procedure CreateConnection;
    { Private declarations }
  public
    procedure Clear;
    { Public declarations }
  end;

var
  FCadastroAluno: TFCadastroAluno;

implementation

{$R *.dfm}

{ TFCadastroAluno }

procedure TFCadastroAluno.AtivarCampos;
begin
  Self.MeNome.Enabled := True;
  Self.MeCPF.Enabled := True;
  Self.MeSexo.Enabled := True;
  Self.MeDataNascimento.Enabled := True;
  Self.MeEmail.Enabled := True;
  Self.EdtSerie.Enabled := True;
  Self.MeNome.SetFocus;
end;

procedure TFCadastroAluno.BtnConfirmarClick(Sender: TObject);
var
  LDaoAluno: TDaoCad_Aluno;
  LDtoAluno: TDtoCad_Aluno;
begin
  LDaoAluno := TDaoCad_Aluno.Create(FDConnection);
  LDtoAluno := TDtoCad_Aluno.Create();
  try
    LDtoAluno.ID := StrToInt(Self.EdtId.Text);
    LDtoAluno.NOME := Self.MeNome.Text;
    LDtoAluno.CPF := Self.MeCPF.Text;
    LDtoAluno.SEXO := Self.MeSexo.Text;
    LDtoAluno.DATANASCIMENTO := Self.MeDataNascimento.Text;
    LDtoAluno.EMAIL := Self.MeEmail.Text;
    LDtoAluno.SERIE := StrToInt(Self.EdtSerie.Text);
    LDaoAluno.Save(LDtoAluno);
    ShowMessage('Cadastro efetuado com sucesso!');
    Clear;
  finally
    LDaoAluno.Free;
    LDtoAluno.Free;
  end;
end;

procedure TFCadastroAluno.BtnExcluirClick(Sender: TObject);
var
  LDaoAluno: TDaoCad_Aluno;
begin
  LDaoAluno := TDaoCad_Aluno.Create(FDConnection);
  try
    LDaoAluno.SafeDelete(StrToInt(Self.EdtId.Text));
    Clear;
  finally
    LDaoAluno.Free;
  end;
end;

procedure TFCadastroAluno.Clear;
var
  LIndexComponent: System.Integer;
begin
  for LIndexComponent := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[LIndexComponent] is TMaskEdit) then
      TMaskEdit(Self.Components[LIndexComponent]).Clear
    else
    if (Self.Components[LIndexComponent] is TEdit) then
      TEdit(Self.Components[LIndexComponent]).Clear

  end;
  MeNome.SetFocus;
end;

procedure TFCadastroAluno.CreateConnection;
begin
  FDConnection := TFDConnection.Create(nil);
  try
    FDConnection.DriverName      := 'FB';
    FDConnection.Params.DriverID := 'FB';
    FDConnection.Params.Database := GetCurrentDir+'\projetoescola.fdb';
    FDConnection.Params.UserName := 'sysdba';
    FDConnection.Params.Password := 'masterkey';
    FDConnection.Connected := True;
  except
    raise Exception.Create('Erro ao conectar ao banco de dados');
  end;
end;

procedure TFCadastroAluno.FormCreate(Sender: TObject);
begin
  CreateConnection();
end;

procedure TFCadastroAluno.EdtIdExit(Sender: TObject);
var
  LDto: TDtoCad_Aluno;
  LDao: TDaoCad_Aluno;
begin
  if (EdtId.Text = '') then
    EdtId.Text := '0';

  if(StrToInt(EdtId.Text) > 0) then
  begin
    LDto := TDtoCad_Aluno.Create;
    LDao := TDaoCad_Aluno.Create(FDConnection);
    try
      if(LDao.Load(LDto, StrToInt(EdtId.Text))) then
      begin
        Self.MeNome.Text := LDto.NOME;
        Self.MeCPF.Text := LDto.CPF;
        Self.MeSexo.Text := LDto.SEXO;
        Self.MeDataNascimento.Text := LDto.DATANASCIMENTO;
        Self.MeEmail.Text := LDto.EMAIL;
        Self.EdtSerie.Text := IntToStr(LDto.SERIE);
      end else
      begin
        ShowMessage('Registro não encontrado!');
        Clear;
        EdtId.Text := '0';
        EdtId.SetFocus;
      end;
    finally
      LDao.Free;
      LDto.Free;
    end;
  end;

  AtivarCampos();
end;

end.
