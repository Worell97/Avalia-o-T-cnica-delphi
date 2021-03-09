unit uCalculo;

interface

uses
  ICalculo, Math;

type
  TCalculoMedia = class(TInterfacedObject, TICalculo)
    function calcular(const AValor1, AValor2, AValor3, AValor4 : System.Currency): System.Currency;
  end;

  TCalculoMaior = class(TInterfacedObject, TICalculo)
    function calcular(const AValor1, AValor2, AValor3, AValor4 : System.Currency): System.Currency;
  end;

  TCalculoMenor = class(TInterfacedObject, TICalculo)
    function calcular(const AValor1, AValor2, AValor3, AValor4 : System.Currency): System.Currency;
  end;

implementation

{ TCalculoMedia }

function TCalculoMedia.calcular(const AValor1, AValor2, AValor3,
  AValor4: System.Currency): System.Currency;
begin
  Result := (AValor1 + AValor2 + AValor3 + AValor4) / 4;
end;

{ TCalculoMenor }

function TCalculoMenor.calcular(const AValor1, AValor2, AValor3,
  AValor4: System.Currency): System.Currency;
begin
  Result := 0;
  if (AValor1 < AValor2) then
  begin
    if(AValor1 < AValor3) then
    begin
      if (AValor1 < AValor4) then
        Result := AValor1
      else
        Result := AValor4;
    end else
    if (AValor3 < AValor4) then
      Result := AValor3;
  end else
  if (AValor2 < AValor3) then
  begin
    if (AValor2 < AValor4) then
      Result := AValor2
    else
      Result := AValor4;
  end else
  if (AValor3 < AValor4) then
    Result := AValor3
  else
    Result := AValor4;
end;

{ TCalculoMaior }

function TCalculoMaior.calcular(const AValor1, AValor2, AValor3,
  AValor4: System.Currency): System.Currency;
begin
  Result := 0;
  if (AValor1 > AValor2) then
  begin
    if(AValor1 > AValor3) then
    begin
      if (AValor1 > AValor4) then
        Result := AValor1
      else
        Result := AValor4;
    end else
    if (AValor3 > AValor4) then
      Result := AValor3;
  end else
  if (AValor2 > AValor3) then
  begin
    if (AValor2 > AValor4) then
      Result := AValor2
    else
      Result := AValor4;
  end else
  if (AValor3 > AValor4) then
    Result := AValor3
  else
    Result := AValor4;
end;

end.
