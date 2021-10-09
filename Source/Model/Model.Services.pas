unit Model.Services;

interface
uses
  CF.Services.ClimateFinder.Interfaces,
  Model.Services.Interfaces,
  Model.Services.Climate.Builder;

type
  TServices<T> = class(TInterfacedObject, IServices<T>)
  private
    FClimateFinder: IClimateFinder<IServices<T>>;
    FParent: T;
  public
    constructor Create(_AParent: T);
    function Climate: IClimateFinder<IServices<T>>;
    function Parent: T;
    class function New(_AParent: T): IServices<T>;
  end;

implementation

{ TServices }

function TServices<T>.Climate: IClimateFinder<IServices<T>>;
begin
  if not Assigned(FClimateFinder) then
    FClimateFinder := TServicesClimateBuilder<T>.NewClimateFinder(Self);
  Result := FClimateFinder;
end;

constructor TServices<T>.Create(_AParent: T);
begin
  FParent:= _AParent
end;

class function TServices<T>.New(_AParent: T): IServices<T>;
begin
  Result:= Self.Create(_AParent);
end;

function TServices<T>.Parent: T;
begin
  Result := FParent;
end;

end.
