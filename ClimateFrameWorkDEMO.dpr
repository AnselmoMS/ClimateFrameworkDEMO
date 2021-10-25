program ClimateFrameWorkDEMO;

uses
  Vcl.Forms,
  Controller in 'Source\Controller\Controller.pas',
  Controller.Interfaces in 'Source\Controller\Controller.Interfaces.pas',
  Model.Services.Interfaces in 'Source\Model\Model.Services.Interfaces.pas',
  Model.Services.Climate.Builder in 'Source\Model\Model.Services.Climate.Builder.pas',
  View.Main in 'Source\View\View.Main.pas' {frmMain},
  Model.Resources.Interfaces in 'Source\Model\Model.Resources.Interfaces.pas',
  Model.Entities.ClimateData in 'Source\Model\Model.Entities.ClimateData.pas',
  Model.Resources.Types in 'Source\Model\Model.Resources.Types.pas',
  Model.Services.Climate in 'Source\Model\Model.Services.Climate.pas',
  Model.Services.Climate.Adapter in 'Source\Model\Model.Services.Climate.Adapter.pas',
  Model.Resources in 'Source\Model\Model.Resources.pas',
  Model.Resources.Images in 'Source\Model\Model.Resources.Images.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
