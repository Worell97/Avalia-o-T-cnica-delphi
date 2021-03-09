unit DTO.Cad_Alunos;

interface

uses
  System.Generics.Collections;

type
  TDtoCad_Aluno = class;

  TDtoCad_Alunos = class;

  TDtoCad_Aluno = class(TObject)
  private
    FID: System.Integer;
    FNOME: System.UnicodeString;
    FCPF: System.UnicodeString;
    FSEXO: System.UnicodeString;
    FDATANASCIMENTO: System.UnicodeString;
    FEMAIL: System.UnicodeString;
    FSERIE: System.Integer;

    procedure SetID(const AID: System.Integer);
    procedure SetNOME(const ANOME: System.UnicodeString);
    procedure SetCPF(const ACPF: System.UnicodeString);
    procedure SetSEXO(const ASEXO: System.UnicodeString);
    procedure SetDATANASCIMENTO(const ADATANASCIMENTO: System.UnicodeString);
    procedure SetEMAIL(const AEMAIL: System.UnicodeString);
    procedure SetSERIE(const ASERIE: System.Integer);

    function GetID(): System.Integer;
    function GetNOME(): System.UnicodeString;
    function GetCPF(): System.UnicodeString;
    function GetSEXO(): System.UnicodeString;
    function GetDATANASCIMENTO(): System.UnicodeString;
    function GetEMAIL(): System.UnicodeString;
    function GetSERIE(): System.Integer;
    procedure InternalClear();


  public
    property ID: System.Integer read GetID write SetID;
    property NOME: System.UnicodeString read GetNOME write SetNOME;
    property CPF: System.UnicodeString read GetCPF write SetCPF;
    property SEXO: System.UnicodeString read GetSEXO write SetSEXO;
    property DATANASCIMENTO: System.UnicodeString read GetDATANASCIMENTO write SetDATANASCIMENTO;
    property EMAIL: System.UnicodeString read GetEMAIL write SetEMAIL;
    property SERIE: System.Integer read GetSERIE write SetSERIE;
    constructor Create();
    procedure Clear; inline;                                                              


  end;
  TDtoCad_Alunos = class(TObjectList<TDtoCad_Aluno>)
  end;

implementation

{ TDtoCad_Alunos }

procedure TDtoCad_Aluno.Clear;
begin
  Self.InternalClear();
end;

constructor TDtoCad_Aluno.Create();
begin
  Self.InternalClear();
  inherited;
end;

function TDtoCad_Aluno.GetSERIE: System.Integer;
begin
  Result := FSERIE;
end;

procedure TDtoCad_Aluno.InternalClear;
begin
  FID := 0;
  FNOME := '';
  FCPF := '';
  FSEXO := '';
  FDATANASCIMENTO := '';
  FEMAIL := '';
  FSERIE := 0;
end;

procedure TDtoCad_Aluno.SetSERIE(const ASERIE: System.Integer);
begin
  FSERIE := ASERIE;
end;

procedure TDtoCad_Aluno.SetID(const AID: System.Integer);
begin
  FID := AID;
end;

procedure TDtoCad_Aluno.SetNOME(const ANOME: System.UnicodeString);
begin
  FNOME := ANOME;
end;

procedure TDtoCad_Aluno.SetCPF(const ACPF: System.UnicodeString);
begin
  FCPF := ACPF;
end;

procedure TDtoCad_Aluno.SetSEXO(const ASEXO: System.UnicodeString);
begin
  FSEXO := ASEXO;
end;

procedure TDtoCad_Aluno.SetDATANASCIMENTO(const ADATANASCIMENTO: System.UnicodeString);
begin
  FDATANASCIMENTO := ADATANASCIMENTO;
end;

procedure TDtoCad_Aluno.SetEMAIL(const AEMAIL: System.UnicodeString);
begin
  FEMAIL := AEMAIL;
end;

function TDtoCad_Aluno.GetDATANASCIMENTO: System.UnicodeString;
begin
  Result := FDATANASCIMENTO;
end;

function TDtoCad_Aluno.GetEMAIL: System.UnicodeString;
begin
  Result := FEMAIL;
end;

function TDtoCad_Aluno.GetID: System.Integer;
begin
  Result := FID;
end;

function TDtoCad_Aluno.GetNOME: System.UnicodeString;
begin
  Result := FNOME;
end;

function TDtoCad_Aluno.GetCPF: System.UnicodeString;
begin
  Result := FCPF;
end;

function TDtoCad_Aluno.GetSEXO: System.UnicodeString;
begin
  Result := FSEXO;
end;

end.
