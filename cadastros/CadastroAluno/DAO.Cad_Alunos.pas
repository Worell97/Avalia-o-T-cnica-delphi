unit DAO.Cad_Alunos;

interface

uses
  System.SysUtils,
  Data.DB,
  DTO.Cad_Alunos,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param;

type

  TDaoCad_Aluno = class(TObject)
  strict private
    const
      Select: System.UnicodeString =
          'SELECT ' +
          '  ID,'+
          '  NOME,'+
          '  CPF,'+
          '  SEXO,'+
          '  DATANASCIMENTO,'+
          '  EMAIL,'+
          '  SERIE '+
          'FROM ' +
          '   Cad_Alunos '+
          'WHERE ' +
          '   ID = :ID ';

      Insert: System.UnicodeString =
          'INSERT INTO Cad_Alunos(' +
          '  ID,'+
          '  NOME,'+
          '  CPF,'+
          '  SEXO,'+
          '  DATANASCIMENTO,'+
          '  EMAIL,'+
          '  SERIE)'+
          'VALUES('+
          '  :ID,'+
          '  :NOME,'+
          '  :CPF,'+
          '  :SEXO,'+
          '  :DATANASCIMENTO,'+
          '  :EMAIL,'+
          '  :SERIE)';

      Update: System.UnicodeString =
          'UPDATE ' +
          ' Cad_Alunos ' +
          'SET ' +
          '  ID = :ID, '+
          '  NOME = :NOME, '+
          '  CPF = :CPF, '+
          '  SEXO = :SEXO, '+
          '  DATANASCIMENTO = :DATANASCIMENTO, '+
          '  EMAIL = :EMAIL, '+
          '  SERIE = :SERIE '+
          'WHERE ' +
          '  ID = :ID';

      Delete: System.UnicodeString =
          'DELETE FROM Cad_Alunos ' +
          'WHERE ' +
          '  ID = :ID';

  private
    FConnection: TFDConnection;
    class procedure InternalLoad(var AQuery: TFDQuery; const AObject: TDtoCad_Aluno); static;
    function GetNextID(AQuery: TFDQuery): System.Integer;
  public
      constructor Create(AConnection: TFDConnection);
      procedure UnsafeSave(const AObject: TDtoCad_Aluno);
      procedure Save(const AObject: TDtoCad_Aluno);
      function Load   (const AObject: TDtoCad_Aluno; const AID: System.Integer): Boolean;
      procedure UnSafeDelete (const AID : System.Integer);
      procedure SafeDelete (const AID : System.Integer);
  end;
implementation

  uses
    System.TypInfo;

{ TDaoCad_Aluno }
constructor TDaoCad_Aluno.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;



function TDaoCad_Aluno.GetNextID(AQuery: TFDQuery): System.Integer;
begin
  AQuery.SQL.Clear;
  AQuery.Open('SELECT GEN_ID(GEN_CAD_ALUNOS_ID, 1) as ID FROM RDB$DATABASE;');

  if not(AQuery.IsEmpty) then
    Result := AQuery.FieldByName('ID').AsInteger
  else
    Result := 0;

  AQuery.SQL.Clear;
end;

class procedure TDaoCad_Aluno.InternalLoad(var AQuery: TFDQuery; const AObject: TDtoCad_Aluno);
begin
  AObject.ID := AQuery.FieldByName('ID').AsInteger;
  AObject.NOME := AQuery.FieldByName('NOME').AsString;
  AObject.CPF := AQuery.FieldByName('CPF').AsString;
  AObject.SEXO := AQuery.FieldByName('SEXO').AsString;
  AObject.DATANASCIMENTO := AQuery.FieldByName('DATANASCIMENTO').AsString;
  AObject.EMAIL := AQuery.FieldByName('EMAIL').AsString;
  AObject.SERIE := AQuery.FieldByName('SERIE').AsInteger;
end;

function TDaoCad_Aluno.Load(const AObject: TDtoCad_Aluno;
  const AID: System.Integer): Boolean;
var
  LQuery: TFDQuery;
begin
  Result := False;
  if (AID > 0) then
  begin
    LQuery := TFDQuery.Create(nil);
    LQuery.Connection := FConnection;
    LQuery.SQL.Add(Select);
    LQuery.ParamByName('ID').AsInteger := AID;
    LQuery.Open;
    Result := not(LQuery.IsEmpty);
    if not(LQuery.IsEmpty) then
      InternalLoad(LQuery, AObject);
  end;
end;

procedure TDaoCad_Aluno.SafeDelete(const AID: System.Integer);
begin
  FConnection.StartTransaction;
  try
    UnSafeDelete(AID);
    FConnection.Commit;
  except
    FConnection.Rollback;
    raise
  end;
end;

procedure TDaoCad_Aluno.Save(const AObject: TDtoCad_Aluno);
begin
   FConnection.StartTransaction;
   try
      UnsafeSave(AObject);
      FConnection.Commit;
   except
      FConnection.Rollback;
      raise;
   end;
end;

procedure TDaoCad_Aluno.UnSafeDelete(const AID: System.Integer);
var
  LQuery: TFDQuery;
begin
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := FConnection;
  LQuery.SQL.Add(Delete);
  LQuery.ParamByName('ID').AsInteger := AID;
  LQuery.ExecSQL;
end;

procedure TDaoCad_Aluno.UnsafeSave(const AObject: TDtoCad_Aluno);
var
  LQuery: TFDQuery;
  LId: System.Integer;
begin
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := FConnection;
  try
    if (AObject.Id <= 0) then
    begin
      LId := GetNextID(LQuery);
      LQuery.SQL.Add(Insert);
    end else
    begin
      LId := AObject.ID;
      LQuery.SQL.Add(Update);
    end;
    LQuery.ParamByName('ID').AsInteger := LId;
    LQuery.ParamByName('NOME').AsString := AObject.NOME;
    LQuery.ParamByName('CPF').AsString := AObject.CPF;
    LQuery.ParamByName('SEXO').AsString := AObject.SEXO;
    LQuery.ParamByName('DATANASCIMENTO').AsString := AObject.DATANASCIMENTO;
    LQuery.ParamByName('EMAIL').AsString := AObject.EMAIL;
    LQuery.ParamByName('SERIE').AsInteger := AObject.SERIE;
    LQuery.ExecSQL;
  finally
    LQuery.Free;
  end;
end;

end.
