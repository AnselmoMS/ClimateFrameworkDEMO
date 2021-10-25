unit Controller.Interfaces;

interface
  uses
    Model.Services.Interfaces,
    Model.Resources.Interfaces;

  type
    IController = interface
      ['{F4EC0EE8-BD1E-4DC9-8A47-C44AAFF60F3C}']
      function Resources: IResources;
      function Climate: IClimateService<IController>;
    end;

implementation

end.
