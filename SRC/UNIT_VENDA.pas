unit UNIT_VENDA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UNIT_CONEXAO, Vcl.DBCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.Imaging.pngimage;

type
  TFormVenda = class(TForm)
    zqVenda: TZQuery;
    sVenda: TDataSource;
    zqVendaItem: TZQuery;
    sVendaItem: TDataSource;
    Panel1: TPanel;
    DBGridVenda: TDBGrid;
    Panel2: TPanel;
    DBGridVendaItem: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    zqCliente: TZQuery;
    SCliente: TDataSource;
    SProduto: TDataSource;
    zqProduto: TZQuery;
    BtnEditar: TButton;
    BtnExcluir: TButton;
    BtnNovo: TButton;
    btnSalvar: TButton;
    BtnCancelar: TButton;
    btnCancelar2: TButton;
    btnExcluir2: TButton;
    btnSalvar2: TButton;
    DBEdit2: TDBEdit;
    PopupMenu1: TPopupMenu;
    NovoItem1: TMenuItem;
    RemoverItem1: TMenuItem;
    edtQuantidade: TDBEdit;
    edtVenda: TDBEdit;
    edt: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtCodVenda: TDBEdit;
    Label7: TLabel;
    zqClienteCODCLIENTE: TIntegerField;
    zqClienteNOME: TWideStringField;
    zqClienteCPF: TLargeintField;
    zqClienteID_MUNICIPIO: TIntegerField;
    zqVendaItemID_VENDAITEM: TIntegerField;
    zqVendaItemID_VENDA: TIntegerField;
    zqVendaItemID_PRODUTO: TIntegerField;
    zqVendaItemQUANTIDADE: TIntegerField;
    zqVendaItemVALOR_UNITARIO: TFloatField;
    btnNovo2: TButton;
    zqVendaID_VENDA: TIntegerField;
    zqVendaID_CLIENTE: TIntegerField;
    zqVendaVALORTOTAL: TSingleField;
    zqVendaCLIENTE: TStringField;
    zqVendaItemPRODUTO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure sVendaDataChange(Sender: TObject; Field: TField);
    procedure NovoItem1Click(Sender: TObject);
    procedure RemoverItem1Click(Sender: TObject);
    procedure zqVendaItemNewRecord(DataSet: TDataSet);
    procedure btnNovo2Click(Sender: TObject);
    procedure btnSalvar2Click(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure btnExcluir2Click(Sender: TObject);
    procedure sVendaStateChange(Sender: TObject);
    procedure sVendaItemStateChange(Sender: TObject);
    procedure zqVendaItemAfterDelete(DataSet: TDataSet);
    procedure zqVendaItemBeforePost(DataSet: TDataSet);
    procedure zqVendaNewRecord(DataSet: TDataSet);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVenda: TFormVenda;

implementation

{$R *.dfm}

procedure TFormVenda.BtnExcluirClick(Sender: TObject);
begin
zqVenda.Delete;
end;

procedure TFormVenda.BtnNovoClick(Sender: TObject);
begin
ZqVenda.Append;
end;


procedure TFormVenda.btnSalvarClick(Sender: TObject);
begin
zqVenda.Post;
end;



procedure TFormVenda.btnCancelar2Click(Sender: TObject);
begin
zqVendaitem.Cancel;
end;


procedure TFormVenda.BtnCancelarClick(Sender: TObject);
begin
zqVenda.cancel;
end;

procedure TFormVenda.BtnEditarClick(Sender: TObject);
begin
zqVenda.Edit;
end;

procedure TFormVenda.btnExcluir2Click(Sender: TObject);
begin
zqVendaitem.delete;
end;

procedure TFormVenda.btnNovo2Click(Sender: TObject);
begin
 zqVendaitem.Append;
end;

procedure TFormVenda.btnSalvar2Click(Sender: TObject);
begin
  zqVendaitem.Post;
end;

procedure TFormVenda.FormShow(Sender: TObject);
begin
zqVenda.Open;
zqVendaitem.Open;
zqCliente.Open;
zqProduto.Open;
end;

procedure TFormVenda.NovoItem1Click(Sender: TObject);
begin
zqVendaitem.Append;
end;

procedure TFormVenda.RemoverItem1Click(Sender: TObject);
begin
zqVendaitem.Delete;
end;

procedure TFormVenda.sVendaDataChange(Sender: TObject; Field: TField);
begin

zqVendaitem.close;
zqVendaitem.ParamByName('id_venda').Value :=
  zqVenda.FieldByName('Id_venda').Value;
zqVendaitem.Open;
end;
    procedure TFormVenda.sVendaItemStateChange(Sender: TObject);
begin
    btnNovo2.Enabled := (zqVendaItem.State in [dsBrowse]);
    BtnCancelar2.Enabled := zqVendaItem.State in [dsInsert, dsEdit];
    btnExcluir2.Enabled := zqVendaItem.State in [dsBrowse];
    btnSalvar2.Enabled := zqVendaItem.State in [dsInsert, dsEdit];
end;

procedure TFormVenda.sVendaStateChange(Sender: TObject);
begin
    btnNovo.Enabled := (zqVenda.State in [dsBrowse]);
    BtnCancelar.Enabled := zqVenda.State in [dsInsert, dsEdit];
    btnExcluir.Enabled := zqVenda.State in [dsBrowse];
    btnSalvar.Enabled := zqVenda.State in [dsInsert,dsEdit];
    btnEditar.Enabled := zqVenda.State in [dsBrowse];
end;

procedure TFormVenda.zqVendaItemAfterDelete(DataSet: TDataSet);
var
total: double;
 begin
  total := 0;

  zqVendaitem.first;
  while not zqVendaitem.eof do
  begin
    total := total +
      zqvendaitem.FieldByName('valor_unitario').AsFloat *
      zqvendaitem.FieldByName('quantidade').asfloat;
      zqvendaitem.Next;
  end;

  zqvenda.Edit;
  zqvenda.FieldByName('valortotal').asString :=
   format ('%.2f',[total]);
  zqvenda.Post;
end;

procedure TFormVenda.zqVendaItemBeforePost(DataSet: TDataSet);
begin
if strToFloat(edtquantidade.Text) <= 0 then
  begin
    showmessage('Quantidade inválida!!');
    edtquantidade.SetFocus;
    abort;
  end;
end;

procedure TFormVenda.zqVendaItemNewRecord(DataSet: TDataSet);
begin
zqVendaitem.FieldByName('id_venda').value :=
  zqVenda.FieldByName('id_venda').Value;

zqVendaItem.FieldByName('id_vendaitem').AsInteger :=
  dmconexao.buscarID('GN_VENDAITEM');
end;
procedure TFormVenda.zqVendaNewRecord(DataSet: TDataSet);
begin
  zqVenda.FieldByName('id_venda').AsInteger :=
  dmconexao.buscarID('GN_VENDA');
end;

end.
