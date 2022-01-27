// ---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

// ---------------------------------------------------------------------------

unit uHomeFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.TabControl, System.ImageList, FMX.ImgList,
  FMX.Controls.Presentation, FMX.Objects, FMX.Effects, FMX.Filter.Effects,
  FMX.ListBox,
{$IF Defined(IOS)}
  macapi.helpers, iOSapi.Foundation, FMX.helpers.iOS;
{$ELSEIF Defined(ANDROID)}
Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Net,
  Androidapi.JNI.App,
  Androidapi.helpers;
{$ELSEIF Defined(MACOS) OR Defined(LINUX)}
Posix.Stdlib;
{$ELSEIF Defined(MSWINDOWS)}
Winapi.ShellAPI, Winapi.Windows;
{$ENDIF}

type
  THomeFrame1 = class(TFrame)
    TabControl1: TTabControl;
    HomeTab: TTabItem;
    SintomasTab: TTabItem;
    HeaderLayout: TLayout;
    VertScrollBox1: TVertScrollBox;
    HeaderText: TText;
    BackgroundRect: TRectangle;
    Label1: TLabel;
    lstSemSintomas: TListBox;
    Panel1: TPanel;
    GridPanelLayout1: TGridPanelLayout;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lstSintomas: TListBox;
    Button1: TButton;
    ImageList1: TImageList;
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure lstSemSintomasChangeCheck(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure THomeFrame1.Image1Click(Sender: TObject);
begin
  TabControl1.ActiveTab := SintomasTab;
end;

procedure THomeFrame1.Image2Click(Sender: TObject);
{$IF Defined(ANDROID)}
var
  Intent: JIntent;
{$ENDIF}
var
  url: String;
begin
  url := 'https://coronavirus.saude.gov.br/';
{$IF Defined(ANDROID)}
  Intent := TJIntent.Create;
  Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
  Intent.setData(StrToJURI(url));
  tandroidhelper.Activity.startActivity(Intent);
  // SharedActivity.startActivity(Intent);
{$ELSEIF Defined(MSWINDOWS)}
  ShellExecute(0, 'OPEN', PWideChar(url), nil, nil, SW_SHOWNORMAL);
{$ELSEIF Defined(IOS)}
  SharedApplication.OpenURL(StrToNSUrl(url));
{$ELSEIF Defined(MACOS)}
  _system(PAnsiChar('open ' + AnsiString(url)));
{$ELSEIF Defined(LINUX)}
  _system(PAnsiChar('xdg-open ' + AnsiString(url)));
{$ENDIF}
end;

procedure THomeFrame1.lstSemSintomasChangeCheck(Sender: TObject);
begin
  lstSintomas.Enabled := not lstSemSintomas.ItemByIndex(0).IsChecked;
  lstSemSintomas.Count
end;

end.
