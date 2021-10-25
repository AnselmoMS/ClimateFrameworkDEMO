unit Model.Resources.Images;

interface
uses
  Model.Resources.Interfaces,
  Winapi.Windows,
  System.Classes,
  Vcl.Graphics,
  Model.Resources.Types;

type
  TResourcesImages = class(TInterfacedObject, IResourcesImages)
  private
    FHandle: THandle;
  public
    constructor Create;
    destructor Destroy; override;
    function GetStream(_AImageResource: TCFResource): TResourceStream;
    function LoadStreamPersist(_AImageResource: TCFResource; _AStreamPersist: IStreamPersist): IResourcesImages;
    function LoadPicture(_AImageResource: TCFResource; _APicture: TPicture): IResourcesImages;
  end;

implementation

uses
  System.TypInfo,
  vcl.Imaging.pngimage;

{ TResourcesImages }

constructor TResourcesImages.Create;
begin
  FHandle := LoadLibrary(Pchar('Resources\CFImages.dll'));
end;

destructor TResourcesImages.Destroy;
begin
  FreeLibrary(FHandle);
  inherited;
end;

function TResourcesImages.GetStream(_AImageResource: TCFResource): TResourceStream;
var
  ResourceStream: TResourceStream;
begin
  ResourceStream:= TResourceStream.Create(FHandle, GetEnumName(TypeInfo(TCFResource), Integer(_AImageResource)), RT_RCDATA);
  Result := ResourceStream
end;

function TResourcesImages.LoadPicture(_AImageResource: TCFResource; _APicture: TPicture): IResourcesImages;
var
  ResourceStream: TResourceStream;
  APNGImage: TPngImage;
begin
  ResourceStream:= GetStream(_AImageResource);
  APNGImage := TPngImage.Create;
  try
    APNGImage.LoadFromStream(ResourceStream);
    _APicture.Assign(APNGImage);
  finally
    ResourceStream.Free;
    APNGImage.Free;
  end;

  Result := Self;
end;

function TResourcesImages.LoadStreamPersist(_AImageResource: TCFResource; _AStreamPersist: IStreamPersist): IResourcesImages;
var
  ResourceStream: TResourceStream;
begin
  ResourceStream:= GetStream(_AImageResource);
  _AStreamPersist.LoadFromStream(ResourceStream);
  ResourceStream.Free;
  Result := Self;
end;

end.
