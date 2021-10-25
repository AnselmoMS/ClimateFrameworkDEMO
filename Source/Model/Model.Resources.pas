unit Model.Resources;

interface

uses
  Model.Resources.Interfaces;

type
  TResources = class(TInterfacedObject, IResources)
  private
    FImages: IResourcesImages;
  public
    function Images: IResourcesImages;
    class function New: TResources;
  end;

implementation

uses
  Model.Resources.Images;

{ TResources }

function TResources.Images: IResourcesImages;
begin
  if not Assigned(FImages) then
    FImages:= TResourcesImages.Create;

  Result := FImages;
end;

class function TResources.New: TResources;
begin
  Result := Self.Create
end;

end.
