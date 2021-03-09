unit DTO.Cad_Notas;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client;

type
  TDtoCad_Nota = class;

  TDtoCad_Notas = class;

  TDtoCad_Nota = class(TObject)
  private
    { private declarations }
    FID: System.Integer;
    FID_ALUNO: System.Integer;
    FID_PROFESSOR: System.Integer;
    FNOTA_BIM1: System.Integer;
    FNOTA_BIM2: System.Integer;
    FNOTA_BIM3: System.Integer;
    FNOTA_BIM4: System.Integer;

    procedure InternalClear();
    procedure SetID(const AID: System.Integer);
    procedure SetID_ALUNO(const AID_ALUNO: System.Integer);
    procedure SetID_PROFESSOR(const AID_PROFESSOR: System.Integer);
    procedure SetNOTA_BIM1(const ANOTA_BIM1: System.Integer);
    procedure SetNOTA_BIM2(const ANOTA_BIM2: System.Integer);
    procedure SetNOTA_BIM3(const ANOTA_BIM3: System.Integer);
    procedure SetNOTA_BIM4(const ANOTA_BIM4: System.Integer);

    function GetID(): System.Integer;
    function GetID_ALUNO(): System.Integer;
    function GetID_PROFESSOR(): System.Integer;
    function GetNOTA_BIM1(): System.Integer;
    function GetNOTA_BIM2(): System.Integer;
    function GetNOTA_BIM3(): System.Integer;
    function GetNOTA_BIM4(): System.Integer;

  public
    constructor Create();
    procedure Clear; inline;                                                              

    property ID: System.Integer read GetID write SetID;
    property ID_ALUNO: System.Integer read GetID_ALUNO write SetID_ALUNO;
    property ID_PROFESSOR: System.Integer read GetID_PROFESSOR write SetID_PROFESSOR;
    property NOTA_BIM1: System.Integer read GetNOTA_BIM1 write SetNOTA_BIM1;
    property NOTA_BIM2: System.Integer read GetNOTA_BIM2 write SetNOTA_BIM2;
    property NOTA_BIM3: System.Integer read GetNOTA_BIM3 write SetNOTA_BIM3;
    property NOTA_BIM4: System.Integer read GetNOTA_BIM4 write SetNOTA_BIM4;

  end;
  TDtoCad_Notas = class(TObjectList<TDtoCad_Nota>)
  end;

implementation

{ TDtoCad_Nota }

procedure TDtoCad_Nota.Clear;
begin
  Self.InternalClear();
end;

constructor TDtoCad_Nota.Create();
begin
  Self.InternalClear();
end;

function TDtoCad_Nota.GetID: System.Integer;
begin
  Result := FID;
end;

function TDtoCad_Nota.GetID_ALUNO: System.Integer;
begin
  Result := FID_ALUNO;
end;

function TDtoCad_Nota.GetID_PROFESSOR: System.Integer;
begin
  Result := FID_PROFESSOR;
end;

function TDtoCad_Nota.GetNOTA_BIM1: System.Integer;
begin
  Result := FNOTA_BIM1;
end;

function TDtoCad_Nota.GetNOTA_BIM2: System.Integer;
begin
  Result := FNOTA_BIM2;
end;

function TDtoCad_Nota.GetNOTA_BIM3: System.Integer;
begin
  Result := FNOTA_BIM3;
end;

function TDtoCad_Nota.GetNOTA_BIM4: System.Integer;
begin
  Result := FNOTA_BIM4;
end;

procedure TDtoCad_Nota.InternalClear;
begin
  FID := 0;
  FID_ALUNO := 0;
  FID_PROFESSOR := 0;
  FNOTA_BIM1 := 0;
  FNOTA_BIM2 := 0;
  FNOTA_BIM3 := 0;
  FNOTA_BIM4 :=0;
end;

procedure TDtoCad_Nota.SetID(const AID: System.Integer);
begin
  FID := AID;
end;

procedure TDtoCad_Nota.SetID_ALUNO(const AID_ALUNO: System.Integer);
begin
  FID_ALUNO := AID_ALUNO;
end;

procedure TDtoCad_Nota.SetID_PROFESSOR(const AID_PROFESSOR: System.Integer);
begin
  FID_PROFESSOR :=AID_PROFESSOR;
end;

procedure TDtoCad_Nota.SetNOTA_BIM1(const ANOTA_BIM1: System.Integer);
begin
  FNOTA_BIM1 := ANOTA_BIM1;
end;

procedure TDtoCad_Nota.SetNOTA_BIM2(const ANOTA_BIM2: System.Integer);
begin
  FNOTA_BIM2 := ANOTA_BIM2;
end;

procedure TDtoCad_Nota.SetNOTA_BIM3(const ANOTA_BIM3: System.Integer);
begin
  FNOTA_BIM3 := ANOTA_BIM3;
end;

procedure TDtoCad_Nota.SetNOTA_BIM4(const ANOTA_BIM4: System.Integer);
begin
  FNOTA_BIM4 := ANOTA_BIM4;
end;

end.
