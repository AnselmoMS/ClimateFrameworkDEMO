unit Model.Resources.Interfaces;

interface

uses
  Vcl.ImageCollection,
  System.Classes,
  Vcl.Graphics,
  Model.Resources.Types;

  type
    IResourcesImages = interface
      function GetStream(_AImageResource: TCFResource): TResourceStream;
      function LoadStreamPersist(_AImageResource: TCFResource; _AStreamPersist: IStreamPersist): IResourcesImages;
      function LoadPicture(_AImageResource: TCFResource; _APicture: TPicture): IResourcesImages;
    end;

    IResources = interface
    ['{35691093-4DBA-4F32-AA58-BA0F14E1B3CF}']
      function Images: IResourcesImages;
    end;

implementation

end.
