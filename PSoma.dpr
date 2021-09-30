program PSoma;

uses
  System.StartUpCopy,
  FMX.Forms,
  USoma in 'USoma.pas' {TabbedwithNavigationForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTabbedwithNavigationForm, TabbedwithNavigationForm);
  Application.Run;
end.
