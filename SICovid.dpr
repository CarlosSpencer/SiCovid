program SICovid;



uses
  System.StartUpCopy,
  FMX.Forms,
  uLoginFrame in 'uLoginFrame.pas' {LoginFrame1: TFrame},
  uLogin in 'uLogin.pas' {FrmLogin},
  uRegistroFrame in 'uRegistroFrame.pas' {SignupFrame1: TFrame},
  uRegistro in 'uRegistro.pas' {FrmRegistro},
  uHomeFrame in 'uHomeFrame.pas' {HomeFrame1: TFrame},
  uHome in 'uHome.pas' {FrmHome},
  SICovid.Dados in 'SICovid.Dados.pas' {DtmDados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDtmDados, DtmDados);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
