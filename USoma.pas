unit USoma;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Gestures, System.Actions, FMX.ActnList, FMX.Edit;

type
  TTabbedwithNavigationForm = class(TForm)
    TabControl1: TTabControl;
    TabA: TTabItem;
    TabControl2: TTabControl;
    ToolBar1: TToolBar;
    lblTitulo: TLabel;
    btnNext: TSpeedButton;
    TabB: TTabItem;
    ToolBar3: TToolBar;
    TabResult: TTabItem;
    ToolBar4: TToolBar;
    lblTitulo1: TLabel;
    btnNext1: TSpeedButton;
    btnNext2: TSpeedButton;
    lblTitulo2: TLabel;
    edtA: TEdit;
    edtB: TEdit;
    Label1: TLabel;
    lblResult: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnNext1Click(Sender: TObject);
    procedure btnNext2Click(Sender: TObject);
    procedure edtAKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtBKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabbedwithNavigationForm: TTabbedwithNavigationForm;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TTabbedwithNavigationForm.btnNext1Click(Sender: TObject);
var
  resultado:  real;
begin
  resultado := StrToFloat(edtA.Text) + StrToFloat(edtB.Text);
  lblResult.Text := FormatFloat('#####0.00',resultado);
  TabControl1.ActiveTab := TabResult;
end;

procedure TTabbedwithNavigationForm.btnNext2Click(Sender: TObject);
begin
  TabB.Enabled := False;
  btnNext.Enabled := False;
  TabResult.Enabled := False;
  btnNext1.Enabled := False;
  edtA.Text := '';
  edtB.Text := '';
  TabControl1.ActiveTab := TabA;
end;

procedure TTabbedwithNavigationForm.btnNextClick(Sender: TObject);
begin
  TabControl1.ActiveTab := TabB;
  edtB.SetFocus;
end;

procedure TTabbedwithNavigationForm.edtAKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if edtA.Text <> '' then
  begin
    TabB.Enabled := True;
    btnNext.Enabled := True;
  end;
  if Key = 13 then
    btnNextClick(Sender);
end;

procedure TTabbedwithNavigationForm.edtBKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if edtB.Text <> '' then
  begin
    TabResult.Enabled := True;
    btnNext1.Enabled := True;
  end;
  if Key = 13 then
    btnNext1Click(Sender);
end;

procedure TTabbedwithNavigationForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabA;
end;

end.

