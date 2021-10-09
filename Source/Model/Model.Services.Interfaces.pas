unit Model.Services.Interfaces;

interface

uses
  CF.Services.ClimateFinder.Interfaces;

  type
    IServices<T> = interface
      ['{619B3437-7C57-49A3-B51C-F2EAD6B65F77}']
      function Climate: IClimateFinder<IServices<T>>;
      function Parent: T;
    end;

implementation

end.
