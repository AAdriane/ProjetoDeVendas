unit UNIT_PRODUTO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UNIT_CONEXAO, Vcl.DBCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage;

type
  TFormProduto = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    edtDescricao: TDBEdit;
    BtnNovo: TButton;
    BtnEditar: TButton;
    BtnExcluir: TButton;
    btnSalvar: TButton;
    BtnCancelar: TButton;
    edtValor: TDBEdit;
    Panel1: TPanel;
    lbPesquisar: TLabel;
    edtPesquisar: TEdit;
    btnPesquisar: TButton;
    zqProduto: TZQuery;
    SProduto: TDataSource;
    DBGrid1: TDBGrid;
    Image1: TImage;
    procedure BtnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure SProdutoStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zqProdutoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProduto: TFormProduto;

implementation

{$R *.dfm}

procedure TFormProduto.BtnCancelarClick(Sender: TObject);
begin
zqProduto.Cancel;
end;

procedure TFormProduto.BtnEditarClick(Sender: TObject);
begin
zqProduto.Edit;
end;

procedure TFormProduto.BtnExcluirClick(Sender: TObject);
begin
zqProduto.Delete;
end;

procedure TFormProduto.BtnNovoClick(Sender: TObject);
begin
zqProduto.append;
end;

procedure TFormProduto.btnPesquisarClick(Sender: TObject);
begin
zqProduto.Close;

ZqProduto.SQL.Text :=
  'SELECT * FROM PRODUTO WHERE PRODUTO.DESCRICAO CONTAINING ''' +
  EdtPesquisar.text + '''';

  ZqProduto.Open;
end;

procedure TFormProduto.btnSalvarClick(Sender: TObject);
begin
zqProduto.post;
end;



procedure TFormProduto.FormShow(Sender: TObject);
begin
zqProduto.open;
end;

procedure TFormProduto.SProdutoStateChange(Sender: TObject);
begin
    btnNovo.Enabled := (ZqProduto.State in [dsBrowse]);
    BtnCancelar.Enabled := ZqProduto.State in [dsInsert, dsEdit];
    btnExcluir.Enabled := ZqProduto.State in [dsBrowse];
    btnSalvar.Enabled := ZqProduto.State in [dsInsert,dsEdit];
    btnEditar.Enabled := ZqProduto.State in [dsBrowse];
end;

procedure TFormProduto.zqProdutoNewRecord(DataSet: TDataSet);
begin
zqProduto.FieldByName('CODproduto').AsInteger :=
    dmConexao.buscarID('GN_PRODUTO');
end;

end.
