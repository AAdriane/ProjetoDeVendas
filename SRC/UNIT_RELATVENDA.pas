unit UNIT_RELATVENDA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UNIT_CONEXAO, Data.DB, RLReport,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RLXLSFilter, RLFilters,
  RLPDFFilter, Vcl.Imaging.pngimage;

type
  TFormRelatVenda = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel5: TRLLabel;
    zqRelatVenda: TZQuery;
    dsRelatVenda: TDataSource;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    zqRelatVendaID_VENDA: TIntegerField;
    zqRelatVendaID_CLIENTE: TIntegerField;
    zqRelatVendaVALORTOTAL: TSingleField;
    zqRelatVendaID_PRODUTO: TIntegerField;
    zqRelatVendaQUANTIDADE: TIntegerField;
    RLLabel6: TRLLabel;
    zqproduto: TZQuery;
    zqRelatVendaProduto: TStringField;
    zqcliente: TZQuery;
    zqRelatVendaNomeCliente: TStringField;
    RLImage1: TRLImage;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSFilter1: TRLXLSFilter;
    RLBand4: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatVenda: TFormRelatVenda;

implementation

{$R *.dfm}


procedure TFormRelatVenda.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
zqRelatVenda.Open;
end;

end.
