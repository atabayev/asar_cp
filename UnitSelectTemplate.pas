unit UnitSelectTemplate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.OleCtrls, SHDocVw;

type
  TFormSelectTemplate = class(TForm)
    WebBrowser: TWebBrowser;
    Panel1: TPanel;
    Panel2: TPanel;
    lbTemplates: TListBox;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure lbTemplatesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSelectTemplate: TFormSelectTemplate;

implementation
uses Unit3;

{$R *.dfm}

procedure TFormSelectTemplate.Button1Click(Sender: TObject);
begin
    FormAddEmails.cbTemplate.Text := lbTemplates.Items.Strings[lbTemplates.ItemIndex];
    FormSelectTemplate.Close;
end;

procedure TFormSelectTemplate.Button2Click(Sender: TObject);
begin
    FormSelectTemplate.Close;
end;

procedure TFormSelectTemplate.FormCreate(Sender: TObject);
begin
    lbTemplates.Items.LoadFromFile('templates.txt');
    lbTemplates.ItemIndex := 0;
end;

procedure TFormSelectTemplate.lbTemplatesClick(Sender: TObject);
begin
    WebBrowser.Navigate('file://'+ 'D:\Templates\'+lbTemplates.Items.Strings[lbTemplates.ItemIndex]);
end;

end.
