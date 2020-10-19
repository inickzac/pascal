program Project1;

uses
  Forms,
  Unit1 in '..\Новая папка\Unit1.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
