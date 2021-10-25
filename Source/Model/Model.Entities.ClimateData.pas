unit Model.Entities.ClimateData;

interface
uses
  Model.Resources.Types;

type
  TClimateDetail = class
  private
    FCondition: string;
    FDate: TDateTime;
    FHumidity: Double;
    FPressure: Double;
    FSensation: Integer;
    FCFIcon: TCFResource;
    FTemperature: Integer;
    FWindDirection: string;
    FWindVelocity: Integer;
  public
    property Condition: string read FCondition write FCondition;
    property Date: TDateTime read FDate write FDate;
    property Humidity: Double read FHumidity write FHumidity;
    property ClimateIcon: TCFResource read FCFIcon write FCFIcon;
    property Pressure: Double read FPressure write FPressure;
    property Sensation: Integer read FSensation write FSensation;
    property Temperature: Integer read FTemperature write FTemperature;
    property WindDirection: string read FWindDirection write FWindDirection;
    property WindVelocity: Integer read FWindVelocity write FWindVelocity;
  end;

  TClimate = class
  private
    FCountry: string;
    FDetail: TClimateDetail;
    FId: Integer;
    FName: string;
    FState: string;
    FProvider: string;
  public
    constructor Create;
    destructor Destroy; override;
    //
    property Country: string read FCountry write FCountry;
    property Detail: TClimateDetail read FDetail;
    property Id: Integer read FId write FId;
    property Name: string read FName write FName;
    property Provider: string read FProvider write FProvider;
    property State: string read FState write FState;
  end;

implementation

{ TClimate }

constructor TClimate.Create;
begin
  FDetail := TClimateDetail.Create;
end;

destructor TClimate.Destroy;
begin
  FDetail.Free;
  inherited;
end;

end.
