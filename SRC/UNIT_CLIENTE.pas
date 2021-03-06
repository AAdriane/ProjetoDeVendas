unit UNIT_CLIENTE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UNIT_CONEXAO, Vcl.DBCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage;

type
  TFormCliente = class(TForm)
    zqCliente: TZQuery;
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtNome: TDBEdit;
    edtNomeCliente: TDBEdit;
    BtnNovo: TButton;
    BtnEditar: TButton;
    BtnExcluir: TButton;
    btnSalvar: TButton;
    BtnCancelar: TButton;
    SCliente: TDataSource;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    ZqMunicipio: TZQuery;
    SMunicipio: TDataSource;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Panel1: TPanel;
    lbPesquisar: TLabel;
    edtPesquisar: TEdit;
    btnPesquisar: TButton;
    Image1: TImage;
    zqClienteCODCLIENTE: TIntegerField;
    zqClienteNOME: TWideStringField;
    zqClienteCPF: TLargeintField;
    zqClienteID_MUNICIPIO: TIntegerField;
    zqClienteNomeMunicipio: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure SClienteStateChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure zqClienteNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCliente: TFormCliente;

implementation

{$R *.dfm}

procedure TFormCliente.BtnCancelarClick(Sender: TObject);
begin
zqCliente.Cancel;
end;

procedure TFormCliente.BtnEditarClick(Sender: TObject);
begin
zqCliente.edit;
end;

procedure TFormCliente.BtnExcluirClick(Sender: TObject);
begin
zqCliente.Delete;
end;

procedure TFormCliente.BtnNovoClick(Sender: TObject);
begin
zqCliente.Append;
end;

procedure TFormCliente.btnPesquisarClick(Sender: TObject);
begin
zqCliente.Close;

ZqCliente.SQL.Text :=
  'SELECT * FROM CLIENTE WHERE CLIENTE.NOME CONTAINING ''' +
  EdtPesquisar.text + '''';

  ZqCliente.Open;
end;

procedure TFormCliente.btnSalvarClick(Sender: TObject);
begin
zqCliente.Post;
end;

procedure TFormCliente.FormShow(Sender: TObject);
begin

 zqCliente.Open;
 zqMunicipio.Open;

end;

procedure TFormCliente.SClienteStateChange(Sender: TObject);
begin
    btnNovo.Enabled := (ZqCliente.State in [dsBrowse]);
    BtnCancelar.Enabled := ZqCliente.State in [dsInsert, dsEdit];
    btnExcluir.Enabled := ZqCliente.State in [dsBrowse];
    btnSalvar.Enabled := ZqCliente.State in [dsInsert,dsEdit];
    btnEditar.Enabled := ZqCliente.State in [dsBrowse];
end;

procedure TFormCliente.zqClienteNewRecord(DataSet: TDataSet);
begin
zqCliente.FieldByName('CODcliente').AsInteger :=
    dmConexao.buscarID('GN_CLIENTE');
end;

end.
