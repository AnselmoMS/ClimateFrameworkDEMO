unit Controller;

interface

uses
  Controller.Interfaces,
  Model.Services.Interfaces,
  Model.Services.Climate,
  Model.Resources.Interfaces;

type
  TController = class(TInterfacedObject, IController)
  private
    FClimateService : IClimateService<IController>;
    FResources: IResources;
  public
    function Climate: IClimateService<IController>;
    function Resources: IResources;
    class function New: IController;
  end;

implementation

uses
  Model.Resources;

{ TController }

class function TController.New: IController;
begin
  Result := Self.Create
end;

function TController.Resources: IResources;
begin
  if not Assigned(FResources) then
    FResources := TResources.Create;
  Result := FResources;
end;

function TController.Climate: IClimateService<IController>;
begin
  if not Assigned(FClimateService) then
    FClimateService := TClimateService.Create(Self);
  Result := FClimateService;
end;

end.
