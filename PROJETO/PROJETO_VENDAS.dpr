program PROJETO_VENDAS;

uses
  Vcl.Forms,
  UNIT_PRINCIPAL_VENDAS in 'UNIT_PRINCIPAL_VENDAS.pas' {TformPrincipal},
  UNIT_CONEXAO in 'UNIT_CONEXAO.pas' {DmConexao: TDataModule},
  UN_MUNICIPIO in 'UN_MUNICIPIO.pas' {FORM_MUNICIPIO},
  Vcl.Themes,
  Vcl.Styles,
  UNIT_CLIENTE in 'UNIT_CLIENTE.pas' {FormCliente},
  UNIT_PRODUTO in 'UNIT_PRODUTO.pas' {FormProduto},
  UNIT_VENDA in 'UNIT_VENDA.pas' {FormVenda},
  UNIT_CLIENTERELAT in 'UNIT_CLIENTERELAT.pas' {FormRelatCliente},
  UNIT_PRODRELAT in 'UNIT_PRODRELAT.pas' {FormRelatProd},
  UNIT_RELATVENDA in 'UNIT_RELATVENDA.pas' {FormRelatVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amakrits');
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TTformPrincipal, TformPrincipal);
  Application.Run;
end.
