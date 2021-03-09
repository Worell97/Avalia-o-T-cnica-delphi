unit MyCustomObjects;

interface

type
  TObjectPessoa = class(TObject)
  private
    FID: System.Integer;
    FNOME: System.UnicodeString;
    FCPF: System.UnicodeString;
    FSEXO: System.UnicodeString;
    FDATANASCIMENTO: System.UnicodeString;
    FEMAIL: System.UnicodeString;

    procedure SetID(const AID: System.Integer);
    procedure SetNOME(const ANOME: System.UnicodeString);
    procedure SetCPF(const ACPF: System.UnicodeString);
    procedure SetSEXO(const ASEXO: System.UnicodeString);
    procedure SetDATANASCIMENTO(const ADATANASCIMENTO: System.UnicodeString);
    procedure SetEMAIL(const AEMAIL: System.UnicodeString);

    function GetID(): System.Integer;
    function GetNOME(): System.UnicodeString;
    function GetCPF(): System.UnicodeString;
    function GetSEXO(): System.UnicodeString;
    function GetDATANASCIMENTO(): System.UnicodeString;
    function GetEMAIL(): System.UnicodeString;
    procedure InternalClear();
  public
    property ID: System.Integer read GetID write SetID;
    property NOME: System.UnicodeString read GetNOME write SetNOME;
    property CPF: System.UnicodeString read GetCPF write SetCPF;
    property SEXO: System.UnicodeString read GetSEXO write SetSEXO;
    property DATANASCIMENTO: System.UnicodeString read GetDATANASCIMENTO write SetDATANASCIMENTO;
    property EMAIL: System.UnicodeString read GetEMAIL write SetEMAIL;
    procedure FieldSet(AField : System.Variant; AValor: System.Variant);
  end;

implementation

{ TObjectPessoa }



function TObjectPessoa.GetID: System.Integer;
begin
  Result := FID;
end;

function TObjectPessoa.GetNOME: System.UnicodeString;
begin
  Result := FNOME;
end;

function TObjectPessoa.GetCPF: System.UnicodeString;
begin
  Result := FCPF;
end;

function TObjectPessoa.GetSEXO: System.UnicodeString;
begin
  Result := FSEXO;
end;

procedure TObjectPessoa.InternalClear;
begin
  FID := 0;
  FNOME := '';
  FCPF := '';
  FSEXO := '';
  FDATANASCIMENTO := '';
  FEMAIL := '';
end;

procedure TObjectPessoa.SetID(const AID: System.Integer);
begin
  FieldSet(FID,AID);
end;

procedure TObjectPessoa.SetNOME(const ANOME: System.UnicodeString);
begin
  FieldSet(FNOME,ANOME);
end;

procedure TObjectPessoa.SetCPF(const ACPF: System.UnicodeString);
begin
  FieldSet(FCPF,ACPF);
end;

procedure TObjectPessoa.SetSEXO(const ASEXO: System.UnicodeString);
begin
  FieldSet(FSEXO,ASEXO);
end;

procedure TObjectPessoa.SetDATANASCIMENTO(const ADATANASCIMENTO: System.UnicodeString);
begin
  FieldSet(FDATANASCIMENTO,ADATANASCIMENTO);
end;

procedure TObjectPessoa.SetEMAIL(const AEMAIL: System.UnicodeString);
begin
  FieldSet(FEMAIL,AEMAIL);
end;

function TObjectPessoa.GetDATANASCIMENTO: System.UnicodeString;
begin
  Result := FDATANASCIMENTO;
end;

function TObjectPessoa.GetEMAIL: System.UnicodeString;
begin
  Result := FEMAIL;
end;

procedure TObjectPessoa.FieldSet(AField : System.Variant; AValor: System.Variant);
begin
  AField := AValor;
end;

end.
