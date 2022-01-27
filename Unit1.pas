unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.DialogService,
  FMX.Objects;

type
  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}



procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  MR: TModalResult;
  mensagem: string;
begin

  MR := mrNone;
  mensagem := Edit1.Text;
  TDialogService.MessageDialog(mensagem,
  System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel],
  System.UITypes.TMsgDlgBtn.mbCancel,
  0,
  procedure(const AResult: TModalResult)
    begin
         // pressed yes
    end);
end;

end.