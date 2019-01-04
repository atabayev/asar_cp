unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Unit3;

type
  TFormSelectMethod = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSelectMethod: TFormSelectMethod;

implementation

{$R *.dfm}

procedure TFormSelectMethod.Button1Click(Sender: TObject);
begin
    FormAddEmails.Visible := true;
    FormAddEmails.Start(1, OpenDialog1.FileName);
    FormSelectMethod.Close;
end;

procedure TFormSelectMethod.Button2Click(Sender: TObject);
begin
    FormAddEmails.Visible := true;
    FormAddEmails.Start(2, OpenDialog1.FileName);
    FormSelectMethod.Close;
end;

procedure TFormSelectMethod.Button3Click(Sender: TObject);
begin
    FormAddEmails.Visible := true;
    FormAddEmails.Start(3, OpenDialog1.FileName);
    FormSelectMethod.Close;
end;

end.
