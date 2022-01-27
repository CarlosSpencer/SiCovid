// ---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

// ---------------------------------------------------------------------------

unit uRegistro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,FireDAC.Stan.Param, FMX.Dialogs, uRegistroFrame;

type
  TFrmRegistro = class(TForm)
    SterlingStyleBook: TStyleBook;
    SignupFrame11: TSignupFrame1;
    procedure SignupFrame11SignupButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistro: TFrmRegistro;

implementation

{$R *.fmx}

uses SICovid.Dados;
// Changes to the layout should be made inside of the TFrame itself. Once changes are made
// to the TFrame you can delete it from the TForm and re-add it. Set it's Align property to
// Client. Optionally, it's ClipChildren property can be set to True if there are any overlapping
// background images.

procedure TFrmRegistro.SignupFrame11SignupButtonClick(Sender: TObject);
begin
  with DtmDados do
  begin
    FDRegistroInsert.ParamByName('nome').AsString := SignupFrame11.NameEdit.Text;
    FDRegistroInsert.ParamByName('email').AsString := SignupFrame11.EmailEdit.Text;
    FDRegistroInsert.ParamByName('senha').AsString := SignupFrame11.PasswordEdit.Text;
    // executar o insert
    FDRegistroInsert.ExecSQL;
    FDRegistroQuery.Close;
    FDRegistroQuery.Open();
    ShowMessage('Registro salvo com sucesso!');
  end;
end;

end.
