unit CadastrosNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, DAO.Cad_Notas, DTO.Cad_Notas, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB;

type
  TFCadastroNotas = class(TForm)
    pnlAlunoNotas: TPanel;
    EdtAluno: TEdit;
    lblAlunoID: TLabel;
    lblNota1: TLabel;
    EdtNota1: TEdit;
    lblNota2: TLabel;
    EdtNota2: TEdit;
    Label3: TLabel;
    EdtNota3: TEdit;
    lblNota4: TLabel;
    EdtNota4: TEdit;
    btnComfirmar: TButton;
    procedure btnComfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FDConnection: TFDConnection;
    procedure CreateConnection;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastroNotas: TFCadastroNotas;

implementation

{$R *.dfm}

procedure TFCadastroNotas.btnComfirmarClick(Sender: TObject);
var
  LDao: TDaoCad_Nota;
  LDto: TDtoCad_Nota;
begin
  LDao := TDaoCad_Nota.Create(FDConnection);
  LDto := TDtoCad_Nota.Create();
  try
    LDto.ID_ALUNO := StrToInt(Self.EdtAluno.Text);
    LDto.NOTA_BIM1 := StrToInt(Self.EdtNota1.Text);
    LDto.NOTA_BIM2 := StrToInt(Self.EdtNota2.Text);
    LDto.NOTA_BIM3 := StrToInt(Self.EdtNota3.Text);
    LDto.NOTA_BIM4 := StrToInt(Self.EdtNota4.Text);
    LDao.Save(LDto);
    ModalResult := mrOk;
  finally
    LDto.Free;
    LDto.Free;
  end;
end;

procedure TFCadastroNotas.CreateConnection;
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

procedure TFCadastroNotas.FormCreate(Sender: TObject);
begin
  CreateConnection();
end;

end.
