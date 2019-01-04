program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FormMain},
  Unit2 in 'Unit2.pas' {FormSelectMethod},
  Unit3 in 'Unit3.pas' {FormAddEmails},
  UnitSelectTemplate in 'UnitSelectTemplate.pas' {FormSelectTemplate};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormSelectMethod, FormSelectMethod);
  Application.CreateForm(TFormAddEmails, FormAddEmails);
  Application.CreateForm(TFormSelectTemplate, FormSelectTemplate);
  Application.Run;
end.
