unit Model.Services.Climate;

interface
uses
  Model.Services.Interfaces,
  Controller.Interfaces,
  Model.Entities.ClimateData,
  CF.Services.ClimateFinder.Interfaces,
  System.SysUtils;

type
  TClimateService = class(TInterfacedObject, IClimateService<IController>)
  private
    FClimateFinder: IClimateFinder;
    FParent: IController;
  public
    constructor Create(_AParent: IController);
    //
    class function New(_AParent: IController): IClimateService<IController>;
    //
    function Find: IClimateService<IController>;
    function GetData: TClimate;
    function WhenGetData(_AProc: TProc): IClimateService<IController>;
    function Parent: IController;
  end;

implementation

uses
  Model.Services.Climate.Builder,
  Model.Services.Climate.Adapter;

{ TClimateService }


constructor TClimateService.Create(_AParent: IController);
begin
  FParent:= _AParent;

  if not Assigned(FClimateFinder) then
    FClimateFinder := TServicesClimateBuilder.NewClimateFinder;
end;

function TClimateService.Find: IClimateService<IController>;
begin
  FClimateFinder.Find;
  Result := Self;
end;

function TClimateService.GetData: TClimate;
begin
  Result := TClimateAdapter.GetClimate(FClimateFinder.GetData);
end;

class function TClimateService.New(_AParent: IController): IClimateService<IController>;
begin
  Result:= Self.Create(_AParent);
end;

function TClimateService.Parent: IController;
begin
  Result := FParent;
end;

function TClimateService.WhenGetData(_AProc: TProc): IClimateService<IController>;
begin
  FClimateFinder.OnAfterGetData(_Aproc);
  Result := Self;
end;

end.
