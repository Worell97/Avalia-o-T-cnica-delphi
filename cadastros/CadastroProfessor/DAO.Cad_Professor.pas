unit DAO.Cad_Professor;

interface

uses
  System.SysUtils,
  Data.DB,
  FireDAC.Comp.Client,
  DTO.Cad_Professor,
  FireDAC.Stan.Param;

type

  TDaoCad_Professor = class(TObject)

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
          '  DISCIPLINA'+
          'FROM ' +
          '   Cad_Professor ' ;

      Insert: System.UnicodeString =
          'INSERT INTO Cad_Professor(' +
          '  ID,'+
          '  NOME,'+
          '  CPF,'+
          '  SEXO,'+
          '  DATANASCIMENTO,'+
          '  EMAIL,'+
          '  DISCIPLINA)'+
          'VALUES('+
          '  :ID,'+
          '  :NOME,'+
          '  :CPF,'+
          '  :SEXO,'+
          '  :DATANASCIMENTO,'+
          '  :EMAIL,'+
          '  :DISCIPLINA)';

      Update: System.UnicodeString =
          'UPDATE ' +
          ' Cad_Professor ' +
          'SET ' +
          '  ID = :ID, '+
          '  NOME = :NOME, '+
          '  CPF = :CPF, '+
          '  SEXO = :SEXO, '+
          '  DATANASCIMENTO = :DATANASCIMENTO, '+
          '  EMAIL = :EMAIL, '+
          '  DISCIPLINA = :DISCIPLINA, '+
          'WHERE ' +
          '  ID = :ID';

      Delete: System.UnicodeString =
          'DELETE FROM Cad_Professor ' +
          'WHERE ' +
          '  ID = :ID';


  private
    FConnection: TFDConnection;
    class procedure InternalLoad(var AQuery: TFDQuery; const AObject: TDtoCad_Professor); static;
    function GetNextID(AQuery: TFDQuery): System.Integer;
  public
      constructor Create(AConnection: TFDConnection);
      procedure UnsafeSave(const AObject: TDtoCad_Professor);
      procedure Save(const AObject: TDtoCad_Professor);
      function Load   (const AObject: TDtoCad_Professor; const AID: System.Integer): Boolean;
      procedure UnSafeDelete (const AID : System.Integer);
      procedure SafeDelete (const AID : System.Integer);
  end;
implementation

  uses
    System.TypInfo;

{ TDaoCad_Professor }
constructor TDaoCad_Professor.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;



function TDaoCad_Professor.GetNextID(AQuery: TFDQuery): System.Integer;
begin
  AQuery.SQL.Clear;
  AQuery.Open('SELECT GEN_ID(GEN_CAD_PROFESSOR_ID, 1) as ID FROM RDB$DATABASE;');

  if not(AQuery.IsEmpty) then
    Result := AQuery.FieldByName('ID').AsInteger
  else
    Result := 0;

  AQuery.SQL.Clear;
end;

class procedure TDaoCad_Professor.InternalLoad(var AQuery: TFDQuery; const AObject: TDtoCad_Professor);
begin
  AObject.ID := AQuery.FieldByName('ID').AsInteger;
  AObject.NOME := AQuery.FieldByName('NOME').AsString;
  AObject.CPF := AQuery.FieldByName('CPF').AsString;
  AObject.SEXO := AQuery.FieldByName('SEXO').AsString;
  AObject.DATANASCIMENTO := AQuery.FieldByName('DATANASCIMENTO').AsString;
  AObject.EMAIL := AQuery.FieldByName('EMAIL').AsString;
  AObject.DISCIPLINA := AQuery.FieldByName('DISCIPLINA').AsString;
end;

function TDaoCad_Professor.Load(const AObject: TDtoCad_Professor;
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

procedure TDaoCad_Professor.SafeDelete(const AID: System.Integer);
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

procedure TDaoCad_Professor.Save(const AObject: TDtoCad_Professor);
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

procedure TDaoCad_Professor.UnSafeDelete(const AID: System.Integer);
var
  LQuery: TFDQuery;
begin
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := FConnection;
  LQuery.SQL.Add(Delete);
  LQuery.ParamByName('ID').AsInteger := AID;
  LQuery.ExecSQL;
end;

procedure TDaoCad_Professor.UnsafeSave(const AObject: TDtoCad_Professor);
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
    LQuery.ParamByName('DISCIPLINA').AsString := AObject.DISCIPLINA;
    LQuery.ExecSQL;
  finally
    LQuery.Free;
  end;
end;

end.
