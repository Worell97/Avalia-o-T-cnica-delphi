unit IPadraoDAO;

interface
uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client;
type

  IDao = interface
    procedure SetConnection(AConnection: TFDConnection);

    function GetConnection: TFDConnection;

    function TryLoad(AId: System.Integer; AObject: TObject): Boolean;
    procedure Load(AId: System.Integer; AObject: TObject);
    procedure Insert(AObject: TObject);
    procedure Update(AObject: TObject);
    procedure Delete(AObject: TObject);

    property Connection: TFDConnection read GetConnection write SetConnection;
  end;

implementation

end.
