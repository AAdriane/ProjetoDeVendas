unit UNIT_PRODRELAT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UNIT_CONEXAO, RLXLSFilter, RLFilters,
  RLPDFFilter, RLReport, Vcl.Imaging.pngimage, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TFormRelatProd = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    zqRelatProduto: TZQuery;
    dsRelatProduto: TDataSource;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLImage1: TRLImage;
    RLBand4: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSFilter1: TRLXLSFilter;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatProd: TFormRelatProd;

implementation

{$R *.dfm}



procedure TFormRelatProd.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
zqRelatProduto.open;
end;

end.
