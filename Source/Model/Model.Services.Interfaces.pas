unit Model.Services.Interfaces;

interface
uses
  Model.Entities.ClimateData,
  System.SysUtils;

  type
    IClimateService<T> = interface
    ['{E7E6A495-2228-44A4-BCE2-9E9A97D0F7A2}']
      function Find: IClimateService<T>;
      function GetData: TClimate;
      function WhenGetData(_AProc: TProc): IClimateService<T>;
      function Parent: T;
    end;

implementation

end.

