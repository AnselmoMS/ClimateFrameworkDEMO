unit View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ImageCollection,
  Vcl.ExtCtrls,
  Controller.Interfaces,
  Controller,
  REST.Types,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Vcl.ComCtrls,
  Model.Entities.ClimateData;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    lblCurrentTemp: TLabel;
    Button1: TButton;
    lblCondition: TLabel;
    lblTemperatureSensation: TLabel;
    rgSource: TRadioGroup;
    lblDateTime: TLabel;
    statusbar: TStatusBar;
    imgIcon: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FController: IController;
    Fdados: TClimate;
    { Private declarations }
    procedure Refresh;
  public
    { Public declarations }
    procedure ObterDados;
    procedure PreencherDados;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  CF.Entities.ClimateData.Types;

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  Refresh
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FController :=
    TController
      .New
        .Climate
          .WhenGetData(ObterDados)
        .Parent;
end;

procedure TfrmMain.ObterDados;
begin
  Fdados := FController
              .Climate
                .GetData;
  PreencherDados;
end;

procedure TfrmMain.PreencherDados;
begin
  lblDateTime.Caption := DateTimeToStr(Fdados.Detail.Date);
  lblCurrentTemp.Caption := Fdados.Detail.Temperature.ToString;
  lblTemperatureSensation.Caption := Fdados.Detail.Sensation.ToString;
  lblCondition.Caption := Fdados.Detail.Condition;

  FController
    .Resources
      .Images
        .LoadPicture(Fdados.Detail.ClimateIcon, imgIcon.Picture);
end;

procedure TfrmMain.Refresh;
begin
  FController
    .Climate
      .Find;
end;

end.
