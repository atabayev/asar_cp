unit UnitSelectTemplate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IdMultipartFormData, System.JSON,
  Vcl.OleCtrls, SHDocVw, ActiveX;

type
  TFormSelectTemplate = class(TForm)
    WebBrowser: TWebBrowser;
    pBrowser: TPanel;
    pListBox: TPanel;
    lbTemplates: TListBox;
    pButtons: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    mmDescription: TMemo;
    procedure lbTemplatesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure WB_LoadHTML(HTMLCode: string);
  public
    { Public declarations }
  end;

  TTemplates = Record
      id: integer;
      name: string;
      body: string;
      descriptions: string;
  End;

var
  FormSelectTemplate: TFormSelectTemplate;
  templates: array of TTemplates;

implementation
uses Unit3, Unit1;

{$R *.dfm}

procedure TFormSelectTemplate.Button1Click(Sender: TObject);
begin
    FormAddEmails.edTemplate.Text := lbTemplates.Items.Strings[lbTemplates.ItemIndex];
    FormSelectTemplate.Close;
end;

procedure TFormSelectTemplate.Button2Click(Sender: TObject);
begin
    FormSelectTemplate.Close;
end;


procedure TFormSelectTemplate.lbTemplatesClick(Sender: TObject);
begin
    WB_LoadHTML(templates[lbTemplates.ItemIndex].body);
    mmDescription.Clear;
    mmDescription.Text := templates[lbTemplates.ItemIndex].descriptions;
//    WebBrowser.Navigate('file://'+ 'D:\Templates\'+lbTemplates.Items.Strings[lbTemplates.ItemIndex]);
end;

procedure TFormSelectTemplate.WB_LoadHTML(HTMLCode: string);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  WebBrowser.Navigate('about:blank');
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

  if Assigned(WebBrowser.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.Text := HTMLCode;
        sl.SaveToStream(ms);
        ms.Seek(0, 0);
        (WebBrowser.Document as
          IPersistStreamInit).Load(TStreamAdapter.Create(ms));
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
end;

procedure TFormSelectTemplate.FormShow(Sender: TObject);
var
    data: TIdMultiPartFormDataStream;
    result : string;
    json: TJSONObject;
    JSONArray: TJSONArray;
    TemplateText : string;
    i: integer;
begin
    lbTemplates.Clear;
    try
        result := FormMain.IdHTTP1.Get(URL + '/manager/get_templates/?token=' + Unit1.TOKEN);
    finally
    end;
    json := TJSONObject.ParseJSONValue(result) as TJSONObject;
    if (json.GetValue('response').Value = 'no templates') then begin
        lbTemplates.Items.Add('Нет шаблонов на сервере');
        exit;
    end;
    if (json.GetValue('response').Value = 'ok') then begin
        JSONArray := TJSONArray(json.GetValue('templates'));
        SetLength(templates, StrToInt(json.GetValue('count').Value));
        for i:=0 to StrToInt(json.GetValue('count').Value)-1 do begin
            templates[i].id := i;
            templates[i].name := TJSONPair(TJSONArray(JSONArray.Items[i]).Items[0]).JsonValue.Value;
            templates[i].descriptions := TJSONPair(TJSONArray(JSONArray.Items[i]).Items[1]).JsonValue.Value;
            templates[i].body := TJSONPair(TJSONArray(JSONArray.Items[i]).Items[2]).JsonValue.Value;
            lbTemplates.Items.Add(templates[i].name)
        end;

    end;
end;

end.
