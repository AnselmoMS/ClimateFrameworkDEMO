unit Model.Services.Climate.Adapter;

interface

uses
  Model.Entities.ClimateData,
  cf.Entities.ClimateData,
  Model.Resources.Types,
  CF.Entities.ClimateData.Types;

type
  TClimateAdapter = class
    class function GetClimate(_AClimateResponse: TClimateData): TClimate;
    class function GetResourceFromClimateIcon(_ACFIcon: TCFIcon): TCFResource;
  end;

implementation

{ TClimateAdapter }

class function TClimateAdapter.GetClimate(_AClimateResponse: TClimateData): TClimate;
begin
  Result := TClimate.Create;
  Result.Id := _AClimateResponse.Id;
  Result.Country:= _AClimateResponse.Country;
  Result.Name:= _AClimateResponse.Name;
  Result.State:= _AClimateResponse.State;
  Result.Provider:= '<Provider Name>';
  //
  Result.Detail.Condition:= _AClimateResponse.data.Condition;

  Result.Detail.Date:= _AClimateResponse.data.Date;
  Result.Detail.Humidity:= _AClimateResponse.data.Humidity;

  Result.Detail.ClimateIcon:= GetResourceFromClimateIcon(_AClimateResponse.data.ClimateIcon);

  Result.Detail.Pressure:= _AClimateResponse.data.Pressure;
  Result.Detail.Sensation:= _AClimateResponse.data.Sensation;

  Result.Detail.Temperature:= _AClimateResponse.data.Temperature;
  Result.Detail.WindDirection:= _AClimateResponse.data.WindDirection;
  Result.Detail.WindVelocity:= _AClimateResponse.data.WindVelocity;
end;

class function TClimateAdapter.GetResourceFromClimateIcon(_ACFIcon: TCFIcon): TCFResource;
begin
  Result := Default(TCFResource);
  case _ACFIcon of
    cfi1:   Result := TCFResource.cfi1;
    cfi1n:  Result := TCFResource.cfi1n;
    cfi2:   Result := TCFResource.cfi2;
    cfi2n:  Result := TCFResource.cfi2n;
    cfi2r:  Result := TCFResource.cfi2r;
    cfi2rn: Result := TCFResource.cfi2rn;
    cfi3:   Result := TCFResource.cfi3;
    cfi3n:  Result := TCFResource.cfi3n;
    cfi3TM: Result := TCFResource.cfi3TM;
    cfi4:   Result := TCFResource.cfi4;
    cfi4n:  Result := TCFResource.cfi4n;
    cfi4r:  Result := TCFResource.cfi4r;
    cfi4rn: Result := TCFResource.cfi4rn;
    cfi4t:  Result := TCFResource.cfi4t;
    cfi4tn: Result := TCFResource.cfi4tn;
    cfi5:   Result := TCFResource.cfi5;
    cfi5n:  Result := TCFResource.cfi5n;
    cfi6:   Result := TCFResource.cfi6;
    cfi6n:  Result := TCFResource.cfi6n;
    cfi7:   Result := TCFResource.cfi7;
    cfi7n:  Result := TCFResource.cfi7n;
    cfi8:   Result := TCFResource.cfi8;
    cfi8n:  Result := TCFResource.cfi8n;
    cfi9:   Result := TCFResource.cfi9;
    cfi9n:  Result := TCFResource.cfi9n;
  end;
end;

end.
