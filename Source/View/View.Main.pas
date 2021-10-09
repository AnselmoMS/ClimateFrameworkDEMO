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
  Vcl.BaseImageCollection,
  Vcl.ImageCollection,
  System.ImageList,
  Vcl.ImgList,
  Vcl.VirtualImageList,
  Vcl.ExtCtrls,
  Controller.Interfaces,
  Controller,
  REST.Types,
  CF.Entities.ClimateData,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Vcl.VirtualImage;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    VirtualImageList1: TVirtualImageList;
    ImageCollection1: TImageCollection;
    lblCurrentTemp: TLabel;
    Button1: TButton;
    VirtualImage1: TVirtualImage;
    lblCondition: TLabel;
    lblTemperatureSensation: TLabel;
    rgSource: TRadioGroup;
    lblDateTime: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FController: IController;
    Fdados: TClimateData;
    { Private declarations }
    procedure TestarAdapter;
  public
    { Public declarations }
    procedure ObterDados;
    procedure PreencherDados;
  end;

var
  Form2: TForm2;

implementation

uses
  CF.Services.ClimateFinder.Adapters,
  System.JSON
  {, Rest.Json},
  CF.StringUtils;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
//  TestarAdapter;
  FController
    .Services
      .Climate
        .Find;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FController :=
    TController
      .New
        .Services
          .Climate
            .OnAfterGetData(ObterDados)
            .Parent
          .Parent;
end;

procedure TForm2.ObterDados;
begin
  Fdados := FController
             .Services
               .Climate
                 .GetData;
  PreencherDados;
end;

procedure TForm2.PreencherDados;
begin
  lblDateTime.Caption := DateTimeToStr(Fdados.Data.Date);
  lblCurrentTemp.Caption := Fdados.Data.Temperature.ToString;
  lblTemperatureSensation.Caption := Fdados.Data.Sensation.ToString;
  VirtualImage1.ImageName := Fdados.Data.Icon;
  lblCondition.Caption := Fdados.Data.Condition;
end;

procedure TForm2.TestarAdapter;
const
  RETURN =
    '{"id":4529,"name":"Itabaiana","state":"SE","country":"BR  ","data":{"temperature":35,"wind_direction":"ESE","wind_velocity":19,"humidity":44.1,"condition":"Poucas nuvens","pressure":992.4,"icon":"2","sensation":38, "date":"2021-09-19 12:34:47"}}';//
    //{"id":4529,"name":"Itabaiana","state":"SE","country":"BR  ","data":{"temperature":26,"wind_direction":"E","wind_velocity":22.3,"humidity":73.1,"condition":"Poucas nuvens","pressure":990.3,"icon":"2n","sensation":27,"date":"2021-09-19 19:32:11"}}
begin
  var jsv := TJSonObject.ParseJSONValue(trim(RETURN));
  FDados:= TClimateFinderAdapterClimaTempo.New.FromJson(jsv);
  //
  PreencherDados;
end;

end.
