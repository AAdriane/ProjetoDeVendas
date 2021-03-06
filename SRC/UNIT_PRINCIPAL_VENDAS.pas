unit UNIT_PRINCIPAL_VENDAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TTformPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TButton: TButton;
    PRODUTO: TButton;
    btnCliente: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    TabSheet3: TTabSheet;
    Button3: TButton;
    Button4: TButton;
    procedure TButtonClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure PRODUTOClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TformPrincipal: TTformPrincipal;

implementation

uses

UN_MUNICIPIO, UNIT_CLIENTE, UNIT_PRODUTO, UNIT_VENDA,UNIT_CLIENTERELAT,UNIT_PRODRELAT,
unit_relatvenda;

{$R *.dfm}

procedure TTformPrincipal.btnClienteClick(Sender: TObject);
begin
formCliente := TformCliente.create(nil);
try
  formcliente.ShowModal;
finally
  formcliente.Free;
end;
end;


procedure TTformPrincipal.Button1Click(Sender: TObject);
begin
formVenda := TFormVenda.Create(nil);
try
  FormVenda.ShowModal;
finally
   FormVenda.Free;
end;
end;

procedure TTformPrincipal.Button2Click(Sender: TObject);
begin
FormRelatCliente := TFormRelatCliente.create(nil);

try
  FormRelatCliente.RLreport1.preview;
finally
FormRelatCliente.free;

end;
end;

procedure TTformPrincipal.Button3Click(Sender: TObject);
begin
  FormRelatProd := TFormRelatProd.create(nil);

try
  FormRelatProd.RLreport1.preview;
finally
FormRelatProd.free;

end;
end;

procedure TTformPrincipal.Button4Click(Sender: TObject);
begin
   FormRelatVenda := TFormRelatVenda.create(nil);

try
  FormRelatVenda.RLreport1.preview;
finally
FormRelatVenda.free;
end;
end;

procedure TTformPrincipal.PRODUTOClick(Sender: TObject);
begin
  FormProduto := TFormProduto.create(nil);
  try
    FormProduto.ShowModal;
  finally
     FormProduto.free;
  end;
end;

procedure TTformPrincipal.TButtonClick(Sender: TObject);
begin
  FORM_MUNICIPIO := TFORM_MUNICIPIO.Create(nil);
  try

  finally
    FORM_MUNICIPIO.ShowModal;
  end;

  FORM_MUNICIPIO.Free;
end;

end.
