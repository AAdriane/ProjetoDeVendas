unit UNIT_CLIENTERELAT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RLReport, UNIT_CONEXAO,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RLXLSFilter,
  RLFilters, RLPDFFilter, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TFormRelatCliente = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TLabel4: TLabel;
    Label4: TLabel;
    RLBand3: TRLBand;
    zqRelatCliente: TZQuery;
    dsCliente: TDataSource;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand4: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLImage1: TRLImage;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSFilter1: TRLXLSFilter;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatCliente: TFormRelatCliente;

implementation

{$R *.dfm}



procedure TFormRelatCliente.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
zqRelatCliente.open;
end;

end.
