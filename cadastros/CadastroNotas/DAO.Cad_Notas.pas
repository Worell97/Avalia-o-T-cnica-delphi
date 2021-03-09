unit DAO.Cad_Notas;

interface

uses
  System.SysUtils,
  Data.DB,
  DTO.CAD_Notas,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param;

type

  TDaoCad_Nota = class
  strict private
    const
      Select: System.UnicodeString =
          'SELECT ' +
          '  ID,'+
          '  ID_ALUNO,'+
          '  ID_PROFESSOR,'+
          '  NOTA_BIM1,'+
          '  NOTA_BIM2,'+
          '  NOTA_BIM3,'+
          '  NOTA_BIM4'+
          'FROM ' +
          '  CAD_ALUNOS_DO_PROFESSOR ' +
          'WHERE ID = :ID ';

      Insert: System.UnicodeString =
          'INSERT INTO CAD_ALUNOS_DO_PROFESSOR(' +
          '  ID,'+
          '  ID_ALUNO,'+
          '  ID_PROFESSOR,'+
          '  NOTA_BIM1,'+
          '  NOTA_BIM2,'+
          '  NOTA_BIM3,'+
          '  NOTA_BIM4)'+
          'VALUES('+
          '  :ID,'+
          '  :ID_ALUNO,'+
          '  :ID_PROFESSOR,'+
          '  :NOTA_BIM1,'+
          '  :NOTA_BIM2,'+
          '  :NOTA_BIM3,'+
          '  :NOTA_BIM4)';

      Update: System.UnicodeString =
          'UPDATE ' +
          ' CAD_ALUNOS_DO_PROFESSOR ' +
          'SET ' +
          '  ID = :ID, '+
          '  ID_ALUNO = :ID_ALUNO, '+
          '  ID_PROFESSOR = :ID_PROFESSOR, '+
          '  NOTA_BIM1 = :NOTA_BIM1, '+
          '  NOTA_BIM2 = :NOTA_BIM2, '+
          '  NOTA_BIM3 = :NOTA_BIM3, '+
          '  NOTA_BIM4 = :NOTA_BIM4 ';


      Delete: System.UnicodeString =
          'DELETE FROM CAD_ALUNOS_DO_PROFESSOR ' +
          'WHERE ' +
          '  ID = :ID';

  private
    FConnection: TFDConnection;
    class procedure InternalLoad(var AQuery: TFDQuery; const AObject: TDtoCad_Nota); static;
    function GetNextID(AQuery: TFDQuery): System.Integer;

  public
      constructor Create(AConnection: TFDConnection);
      procedure UnsafeSave(const AObject: TDtoCad_Nota);
      procedure Save(const AObject: TDtoCad_Nota);
      function Load   (const AObject: TDtoCad_Nota; const AID: System.Integer): Boolean;
      function LoadListPorProfessor  (const AObjectList: TDtoCad_Notas; const AProfessorID: System.Integer): Boolean;
      procedure UnSafeDelete (const AID: System.Integer);
      procedure SafeDelete (const AID: System.Integer);

  end;
implementation

  uses
    System.TypInfo;

{ TDaoCad_Nota }
constructor TDaoCad_Nota.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

class procedure TDaoCad_Nota.InternalLoad(var AQuery: TFDQuery;const AObject: TDtoCad_Nota);
begin
  AObject.ID := AQuery.FieldByName('ID').AsInteger;
  AObject.ID_ALUNO := AQuery.FieldByName('ID_ALUNO').AsInteger;
  AObject.ID_PROFESSOR := AQuery.FieldByName('ID_PROFESSOR').AsInteger;
  AObject.NOTA_BIM1 := AQuery.FieldByName('NOTA_BIM1').AsInteger;
  AObject.NOTA_BIM2 := AQuery.FieldByName('NOTA_BIM2').AsInteger;
  AObject.NOTA_BIM3 := AQuery.FieldByName('NOTA_BIM3').AsInteger;
  AObject.NOTA_BIM4 := AQuery.FieldByName('NOTA_BIM4').AsInteger;
end;


function TDaoCad_Nota.Load(const AObject: TDtoCad_Nota; const AID: System.Integer): Boolean;
const
  CWhere =
    'WHERE ' +
    '  ID = :ID ';
var
  LQuery: TFDQuery;
begin
  Result := False;
  if (AID > 0) then
  begin
    LQuery := TFDQuery.Create(nil);
    LQuery.Connection := FConnection;
    LQuery.SQL.Add(Select+CWhere);
    LQuery.ParamByName('ID').AsInteger := AID;
    LQuery.Open;
    Result := not(LQuery.IsEmpty);
    if not(LQuery.IsEmpty) then
      InternalLoad(LQuery, AObject);
  end;
end;

function TDaoCad_Nota.LoadListPorProfessor(const AObjectList: TDtoCad_Notas;
  const AProfessorID: System.Integer): Boolean;
const
  CWhere =
    'WHERE ' +
    '  ID_PROFESSOR = :ID_PROFESSOR ';
var
  LQuery: TFDQuery;
  LObjectAux : TDtoCad_Nota;
begin
  Result := False;
  if (AProfessorID > 0) then
  begin
    LQuery := TFDQuery.Create(nil);
    LQuery.Connection := FConnection;
    LQuery.SQL.Add(Select+CWhere);
    LQuery.ParamByName('ID_PROFESSOR').AsInteger := AProfessorID;
    LQuery.Open;
    Result := not(LQuery.IsEmpty);
    if not(LQuery.IsEmpty) then
    LQuery.First;
    while not(LQuery.Eof) do
    begin
      LObjectAux := TDtoCad_Nota.Create;
      InternalLoad(LQuery, LObjectAux);
      AObjectList.Add(LObjectAux);
    end;
  end;
end;

function TDaoCad_Nota.GetNextID(AQuery: TFDQuery): System.Integer;
begin
  AQuery.SQL.Clear;
  AQuery.Open('SELECT GEN_ID(GEN_CAD_NOTAS, 1) as ID FROM RDB$DATABASE;');

  if not(AQuery.IsEmpty) then
    Result := AQuery.FieldByName('ID').AsInteger
  else
    Result := 0;

  AQuery.SQL.Clear;
end;

procedure TDaoCad_Nota.SafeDelete(const AID: System.Integer);
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

procedure TDaoCad_Nota.Save(const AObject: TDtoCad_Nota);
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

procedure TDaoCad_Nota.UnSafeDelete(const AID: System.Integer);
var
  LQuery: TFDQuery;
begin
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := FConnection;
  LQuery.SQL.Add(Delete);
  LQuery.ParamByName('ID').AsInteger := AID;
  LQuery.ExecSQL;
end;

procedure TDaoCad_Nota.UnsafeSave(const AObject: TDtoCad_Nota);
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
    LQuery.ParamByName('ID_ALUNO').AsInteger := AObject.ID_ALUNO;
    LQuery.ParamByName('ID_PROFESSOR').AsInteger := AObject.ID_PROFESSOR;
    LQuery.ParamByName('NOTA_BIM1').AsInteger := AObject.NOTA_BIM1;
    LQuery.ParamByName('NOTA_BIM2').AsInteger := AObject.NOTA_BIM2;
    LQuery.ParamByName('NOTA_BIM3').AsInteger := AObject.NOTA_BIM3;
    LQuery.ParamByName('NOTA_BIM4').AsInteger := AObject.NOTA_BIM4;
    LQuery.ExecSQL;
  finally
    LQuery.Free;
  end;
end;

end.
