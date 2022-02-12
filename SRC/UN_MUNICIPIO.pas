unit UN_MUNICIPIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UNIT_CONEXAO, Data.DB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Imaging.pngimage;

type
  TFORM_MUNICIPIO = class(TForm)
    ZqMunicipio: TZQuery;
    SMunicipio: TDataSource;
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    DbgMunicipio: TDBGrid;
    BtnNovo: TButton;
    BtnEditar: TButton;
    BtnExcluir: TButton;
    btnSalvar: TButton;
    Panel3: TPanel;
    EdtPesquisa: TEdit;
    Button1: TButton;
    Label2: TLabel;
    BtnCancelar: TButton;
    cbUF: TDBComboBox;
    Image1: TImage;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SMunicipioStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure ZqMunicipioNewRecord(DataSet: TDataSet);
    procedure ZqMunicipioBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_MUNICIPIO: TFORM_MUNICIPIO;

implementation

{$R *.dfm}

procedure TFORM_MUNICIPIO.BtnCancelarClick(Sender: TObject);
begin
  //cancela as edições/alterações q estão sendo feitas
  ZqMunicipio.Cancel;
end;

procedure TFORM_MUNICIPIO.BtnEditarClick(Sender: TObject);
begin
//edita o registro selecionado
ZqMunicipio.Edit;
end;

procedure TFORM_MUNICIPIO.BtnExcluirClick(Sender: TObject);
begin
//deleta o registro selecionado
ZqMunicipio.Delete;

 //mostra msg na tela se realmente quer excluir
if MessageDlg('deseja excluir?', mtConfirmation,[mbYes, mbNo],0,mbNo) = mrYes then
  ZqMunicipio.Delete;

end;

procedure TFORM_MUNICIPIO.BtnNovoClick(Sender: TObject);
begin
//insere novo registro no zquery
ZqMunicipio.Append;
end;

procedure TFORM_MUNICIPIO.Button1Click(Sender: TObject);
begin
ZqMunicipio.Close;

ZqMunicipio.SQL.Text :=
  'SELECT * FROM MUNICIPIO WHERE MUNICIPIO.NOME CONTAINING ''' +
  EdtPesquisa.text + '''';

  ZqMunicipio.Open;

end;

procedure TFORM_MUNICIPIO.FormShow(Sender: TObject);
begin
  //quando abrir o formulario já abre a pesquisa
  ZqMunicipio.Open;
end;



procedure TFORM_MUNICIPIO.btnSalvarClick(Sender: TObject);
begin
//salva os dados inseridos
ZqMunicipio.Post;
end;

procedure TFORM_MUNICIPIO.SMunicipioStateChange(Sender: TObject);
begin

  //só deixa iserir um novo dado se estiver no modo editar ou inserir
    btnNovo.Enabled := (ZqMunicipio.State in [dsBrowse]);

  //só deixa cancelar se estiver no modo de inserçaõ ou edição
    BtnCancelar.Enabled := ZqMunicipio.State in [dsInsert, dsEdit];

  //só deixa excluir se estiver no modo de navegação
    btnExcluir.Enabled := ZqMunicipio.State in [dsBrowse];

    btnSalvar.Enabled := ZqMunicipio.State in [dsInsert,dsEdit];

    btnEditar.Enabled := ZqMunicipio.State in [dsBrowse];

end;

procedure TFORM_MUNICIPIO.ZqMunicipioBeforePost(DataSet: TDataSet);
begin
  if trim(dbedit1.Text) = '' then
  begin
   showmessage('Informe o código!!');
   abort;
  end;

  if trim(dbedit2.Text) = '' then
  begin
   showmessage('Informe o Nome!!');
   dbedit2.SetFocus;
   abort;
  end;

  if trim(cbuf.Text) = '' then
  begin
   showmessage('Informe o Estado!!');
   cbuf.SetFocus;
   abort;
  end;




end;

procedure TFORM_MUNICIPIO.ZqMunicipioNewRecord(DataSet: TDataSet);
begin
zqMunicipio.FieldByName('id_municipio').AsInteger :=
    dmConexao.buscarID('GN_MUNICIPIO');
end;

end.
