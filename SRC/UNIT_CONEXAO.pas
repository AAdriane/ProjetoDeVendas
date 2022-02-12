unit UNIT_CONEXAO;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDmConexao = class(TDataModule)
    ZcConexao: TZConnection;
    zqGenerator: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function buscarID(NomeGenerator: string) : integer;
  end;

var
  DmConexao: TDmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmConexao }

function TDmConexao.buscarID(NomeGenerator: string): integer;
begin
  zqGenerator.Close;
  zqGenerator.SQL.Text := ' SELECT gen_id ('+
    NomeGenerator + ', 1)FROM RDB$DATABASE';

  zqGenerator.open;

  result := zqGenerator.FieldByName('GEN_ID').AsInteger ;
end;

end.
