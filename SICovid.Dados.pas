unit SICovid.Dados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDtmDados = class(TDataModule)
    FDConexao: TFDConnection;
    FDRegistroInsert: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDRegistroQuery: TFDQuery;
    FDLoginQuery: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmDados: TDtmDados;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

uses
  System.IOUtils;

procedure TDtmDados.DataModuleCreate(Sender: TObject);
begin
{$IF Defined(ANDROID)}
  FDConexao.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath,
    'sicovid.db');
{$ELSEIF Defined(MSWINDOWS) or Defined(LINUX)}
  FDConexao.Params.Values['Database'] := 'sicovid.db';
{$ENDIF}
  FDConexao.Connected := true;
end;

end.
