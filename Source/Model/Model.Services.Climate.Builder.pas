unit Model.Services.Climate.Builder;

interface
uses
  CF.Services.ClimateFinder.Interfaces,
  CF.Services.ClimateFinder.Types,
  CF.Services.ClimateFinder,
  Model.Services.Interfaces;

type
  TServicesClimateBuilder = class
  var
    FLocation: TClimateLocation;
    FDefaultLocation: Boolean;
    public
    class function NewClimateFinder: IClimateFinder;
  end;

implementation

uses
  CF.Connections.Rest.Interfaces,
  CF.Connections.Rest.Connector.RR4D,
  CF.Services.ClimateFinder.Provider.ClimaTempo,
  CF.Entities.ClimateData, System.Classes;

{ TClimateFindeBuilder }

class function TServicesClimateBuilder.NewClimateFinder: IClimateFinder;
var
  LConn: IRestConnector;
  LLocDefault: TClimateLocation;
  LProviderClimaTempo: IRestProvider<TClimateData>;
begin
  Self.Create;

  //Busca do banco ou ini
  LLocDefault.ID := 4529;
  LLocDefault.Country := 'Brasil';
  LLocDefault.State := 'SE';
  LLocDefault.City := 'Itabaiana';

  //Default Connector
  LConn := TConnectorRestRR4D.New;

  //Provider - Climatempo
  LProviderClimaTempo:=
    TClimateFinderProviderClimaTempo
      .New
        .WithToken('0037758ec0a554d1f47b83583a420e14');

  Result :=
    TClimateFinder
      .New
        .WithConnector(LConn)
        .AddProvider(LProviderClimaTempo)
        //.AddProvider(LProviderHG)
        .WithLocation(LLocDefault);
end;

end.
