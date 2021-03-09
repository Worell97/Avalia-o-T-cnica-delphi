unit cadastroProfessor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DAO.Cad_Professor, DTO.Cad_Professor, FireDAC.Comp.Client,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, CadastrosNotas,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TFCadastroProfessor = class(TForm)
    dspDadosALunos: TDataSetProvider;
    cdsDadosAlunos: TClientDataSet;
    dtsDadosAlunos: TDataSource;
    pnlAlunos: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    pnlButtons: TPanel;
    BtnConfirmar: TButton;
    BtnExcluir: TButton;
    pnlProfessor: TPanel;
    EdtId: TEdit;
    LblDiciplina: TLabel;
    LblEmail: TLabel;
    LblID: TLabel;
    LblNome: TLabel;
    MeDiciplina: TMaskEdit;
    MeEmail: TMaskEdit;
    MeNome: TMaskEdit;
    Label2: TLabel;
    MeCPF: TMaskEdit;
    LblCPF: TLabel;
    LblSexo: TLabel;
    MeSexo: TMaskEdit;
    Label5: TLabel;
    MeDataNascimento: TMaskEdit;
    ConnectionAlunos: TFDConnection;
    tblAlunos: TFDTable;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure CreateConnection;
    procedure FormCreate(Sender: TObject);
    procedure EdtIdExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FDConnection: TFDConnection;
//    procedure CarregarAlunos();
    procedure AtivarCampos();
    procedure Clear();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastroProfessor: TFCadastroProfessor;

implementation

{$R *.dfm}

procedure TFCadastroProfessor.BtnConfirmarClick(Sender: TObject);
var
  LDao: TDaoCad_Professor;
  LDto: TDtoCad_Professor;
begin
  LDao := TDaoCad_Professor.Create(FDConnection);
  LDto := TDtoCad_Professor.Create();
  try
    LDto.ID := StrToInt(Self.EdtId.Text);
    LDto.NOME := Self.MeNome.Text;
    LDto.CPF := Self.MeCPF.Text;
    LDto.SEXO := Self.MeSexo.Text;
    LDto.DATANASCIMENTO := Self.MeDataNascimento.Text;
    LDto.EMAIL := Self.MeEmail.Text;
    LDto.DISCIPLINA := Self.MeDiciplina.Text;
    LDao.Save(LDto);
    ShowMessage('Cadastro efetuado com sucesso!');
    Clear;
  finally
    LDto.Free;
    LDto.Free;
  end;
end;

procedure TFCadastroProfessor.BtnExcluirClick(Sender: TObject);
var
  LDao: TDaoCad_Professor;
begin
  LDao := TDaoCad_Professor.Create(FDConnection);
  try
    LDao.SafeDelete(StrToInt(Self.EdtId.Text));
    Clear;
  finally
    LDao.Free;
  end;
end;

procedure TFCadastroProfessor.Button1Click(Sender: TObject);
var
  LCadastroNotas: TFCadastroNotas;
begin
  LCadastroNotas := TFCadastroNotas.Create(self);
  if (LCadastroNotas.ShowModal = mrOk) then
  begin
    ShowMessage('Aluno adicionado com sucesso!');
//    CarregarAlunos();
  end;
end;

procedure TFCadastroProfessor.Clear;
var
  LIndexComponent: System.Integer;
begin
  for LIndexComponent := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[LIndexComponent] is TMaskEdit) then
      TMaskEdit(Self.Components[LIndexComponent]).Clear;
  end;
  MeNome.SetFocus;
end;


procedure TFCadastroProfessor.CreateConnection;
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

procedure TFCadastroProfessor.EdtIdExit(Sender: TObject);
var
  LDto: TDtoCad_Professor;
  LDao: TDaoCad_Professor;
begin
  if (EdtId.Text = '') then
    EdtId.Text := '0';

  if(StrToInt(EdtId.Text) > 0) then
  begin
    LDto := TDtoCad_Professor.Create;
    LDao := TDaoCad_Professor.Create(FDConnection);
    try
      if(LDao.Load(LDto, StrToInt(EdtId.Text))) then
      begin
        Self.MeNome.Text := LDto.NOME;
        Self.MeCPF.Text := LDto.CPF;
        Self.MeSexo.Text := LDto.SEXO;
        Self.MeDataNascimento.Text := LDto.DATANASCIMENTO;
        Self.MeEmail.Text := LDto.EMAIL;
        Self.MeDiciplina.Text := LDto.DISCIPLINA;
        MeNome.SetFocus;
      end else
      begin
        ShowMessage('Registro não encontrado!');
        EdtId.Text := '0';
        Clear;
      end;
    finally
      LDao.Free;
      LDto.Free;
    end;
  end else
  begin
    AtivarCampos();
    MeNome.SetFocus;
  end;
end;

procedure TFCadastroProfessor.FormCreate(Sender: TObject);
begin
  CreateConnection();
end;

procedure TFCadastroProfessor.AtivarCampos;
begin
  Self.MeNome.Enabled := True;
  Self.MeCPF.Enabled := True;
  Self.MeSexo.Enabled := True;
  Self.MeDataNascimento.Enabled := True;
  Self.MeEmail.Enabled := True;
  Self.MeDiciplina.Enabled := True;
end;

end.
