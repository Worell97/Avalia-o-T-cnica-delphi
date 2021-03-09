unit Controller.Aluno;

interface

uses
  Vcl.Forms, IController.Cadastros, Vcl.Mask, DAO.Cad_Alunos, DTO.Cad_Alunos, FireDAC.Comp.Client, System.SysUtils;

type
  TControllerAluno = class(TInterfacedObject, ICadastros)
    private
      FVisual: TForm;
      procedure Cadastrar;
      procedure Editar;
      function CreateConnection(): TFDConnection;
    public
      procedure Confirmar;
      procedure Excluir;
      procedure Clear;

      constructor Create(AVisual: TForm);
  end;

implementation

{ TControllerAluno }

procedure TControllerAluno.Cadastrar;
begin
  //Implementar Cadastro
end;

procedure TControllerAluno.Clear;
var
  LIndexComponent: System.Integer;
begin
  for LIndexComponent := 0 to FVisual.ComponentCount - 1 do
  begin
    if (FVisual.Components[LIndexComponent] is TMaskEdit) then
      TMaskEdit(FVisual.Components[LIndexComponent]).Clear;
  end;
end;

procedure TControllerAluno.Confirmar;
end;

constructor TControllerAluno.Create(AVisual: TForm);
begin
  FVisual := AVisual;
end;

function TControllerAluno.CreateConnection: TFDConnection;
begin
  try
    Result.DriverName      := 'FB';
    Result.Params.DriverID := 'FB';
    Result.Params.Database := GetCurrentDir+'\projetoescola.fdb';
    Result.Params.UserName := 'sysdba';
    Result.Params.Password := 'masterkey';
    Result.Connected := True;
  except
    raise Exception.Create('Erro ao conectar ao banco de dados');
  end;
end;

procedure TControllerAluno.Editar;
begin

end;

procedure TControllerAluno.Excluir;
begin

end;

end.
