program ClimateFrameWorkDEMO;

uses
  Vcl.Forms,
  Controller in 'Source\Controller\Controller.pas',
  Controller.Interfaces in 'Source\Controller\Controller.Interfaces.pas',
  Model.Services.Interfaces in 'Source\Model\Model.Services.Interfaces.pas',
  Model.Services in 'Source\Model\Model.Services.pas',
  Model.Services.Climate.Builder in 'Source\Model\Model.Services.Climate.Builder.pas',
  View.Main in 'Source\View\View.Main.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
