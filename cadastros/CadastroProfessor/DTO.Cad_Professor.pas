unit DTO.Cad_Professor;

interface

uses
  System.Generics.Collections;

type
  TDtoCad_Professor = class;

  TDtoCad_Professores = class;

  TDtoCad_Professor = class(TObject)
  private
    FID: System.Integer;
    FNOME: System.UnicodeString;
    FCPF: System.UnicodeString;
    FSEXO: System.UnicodeString;
    FDATANASCIMENTO: System.UnicodeString;
    FEMAIL: System.UnicodeString;
    FDISCIPLINA: System.UnicodeString;

    procedure SetID(const AID: System.Integer);
    procedure SetNOME(const ANOME: System.UnicodeString);
    procedure SetCPF(const ACPF: System.UnicodeString);
    procedure SetSEXO(const ASEXO: System.UnicodeString);
    procedure SetDATANASCIMENTO(const ADATANASCIMENTO: System.UnicodeString);
    procedure SetEMAIL(const AEMAIL: System.UnicodeString);
    procedure SetDISCIPLINA(const ADISCIPLINA: System.UnicodeString);

    function GetID(): System.Integer;
    function GetNOME(): System.UnicodeString;
    function GetCPF(): System.UnicodeString;
    function GetSEXO(): System.UnicodeString;
    function GetDATANASCIMENTO(): System.UnicodeString;
    function GetEMAIL(): System.UnicodeString;
    function GetDISCIPLINA(): System.UnicodeString;

    procedure InternalClear();

  public
    constructor Create();

    procedure Clear; inline;
    property ID: System.Integer read GetID write SetID;
    property NOME: System.UnicodeString read GetNOME write SetNOME;
    property CPF: System.UnicodeString read GetCPF write SetCPF;
    property SEXO: System.UnicodeString read GetSEXO write SetSEXO;
    property DATANASCIMENTO: System.UnicodeString read GetDATANASCIMENTO write SetDATANASCIMENTO;
    property EMAIL: System.UnicodeString read GetEMAIL write SetEMAIL;
    property DISCIPLINA: System.UnicodeString read GetDISCIPLINA write SetDISCIPLINA;
  end;
  TDtoCad_Professores = class(TObjectList<TDtoCad_Professor>)
  end;

implementation

{ TDtoCad_Professor }

procedure TDtoCad_Professor.Clear;
begin
  Self.InternalClear();
end;

constructor TDtoCad_Professor.Create();
begin
  Self.InternalClear();
  inherited;
end;

function TDtoCad_Professor.GetDISCIPLINA: System.UnicodeString;
begin
  Result := FDISCIPLINA;
end;

procedure TDtoCad_Professor.InternalClear;
begin
  FID := 0;
  FNOME := '';
  FCPF := '';
  FSEXO := '';
  FDATANASCIMENTO := '';
  FEMAIL := '';
  FDISCIPLINA := '';
end;

procedure TDtoCad_Professor.SetDISCIPLINA(const ADISCIPLINA: System.UnicodeString);
begin
  FDISCIPLINA := ADISCIPLINA;
end;


procedure TDtoCad_Professor.SetID(const AID: System.Integer);
begin
  FID := AID;
end;

procedure TDtoCad_Professor.SetNOME(const ANOME: System.UnicodeString);
begin
  FNOME := ANOME;
end;

procedure TDtoCad_Professor.SetCPF(const ACPF: System.UnicodeString);
begin
  FCPF := ACPF;
end;

procedure TDtoCad_Professor.SetSEXO(const ASEXO: System.UnicodeString);
begin
  FSEXO := ASEXO;
end;

procedure TDtoCad_Professor.SetDATANASCIMENTO(const ADATANASCIMENTO: System.UnicodeString);
begin
  FDATANASCIMENTO := ADATANASCIMENTO;
end;

procedure TDtoCad_Professor.SetEMAIL(const AEMAIL: System.UnicodeString);
begin
  FEMAIL := AEMAIL;
end;

function TDtoCad_Professor.GetDATANASCIMENTO: System.UnicodeString;
begin
  Result := FDATANASCIMENTO;
end;

function TDtoCad_Professor.GetEMAIL: System.UnicodeString;
begin
  Result := FEMAIL;
end;

function TDtoCad_Professor.GetID: System.Integer;
begin
  Result := FID;
end;

function TDtoCad_Professor.GetNOME: System.UnicodeString;
begin
  Result := FNOME;
end;

function TDtoCad_Professor.GetCPF: System.UnicodeString;
begin
  Result := FCPF;
end;

function TDtoCad_Professor.GetSEXO: System.UnicodeString;
begin
  Result := FSEXO;
end;


end.
