unit Controller;

interface

uses
  Controller.Interfaces,
  Model.Services.Interfaces,
  Model.Services;

type
  TController = class(TInterfacedObject, IController)
  private
    FServices : IServices<IController>;
  public
    function Services: IServices<IController>;
    class function New: IController;
  end;

implementation

{ TController }

class function TController.New: IController;
begin
  Result := Self.Create
end;

function TController.Services: IServices<IController>;
begin
  if not Assigned(FServices) then
    FServices := TServices<IController>.Create(Self);
  Result := FServices;
end;

end.
