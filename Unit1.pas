unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Unit2, IniFiles,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdMultipartFormData,
  System.JSON, Vcl.StdCtrls, Unit3;

const
    INI_FILE = 'configs.ini';
    TOKEN = '111';
    URL = 'http://localhost:8000';


type
  TTarget = Record
    email: string;
    sender: string;
    sender_password: string;
    subject: string;
    body: string;
    method: string;
    country: string;
    description: string;
    comment: string;
  end;

  TFormMain = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Image1: TImage;
    MainTable: TListView;
    StatusesImageList: TImageList;
    NetHTTPClient1: TNetHTTPClient;
    IdHTTP1: TIdHTTP;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadConfigs;
    procedure SaveConfigs;
    procedure AddToListView(email, country, description, virus, fishing, add_date,
                         hack_date, priority, comments, status : string);
    procedure ChangeStatus(status : String);
  public
    { Public declarations }
    procedure UpdateTable;
    function  AddToStack(target : TTarget) : string;
  end;


var
  FormMain: TFormMain;
  Statuses : TStringList;
  SelectedItem : TListItem;

implementation

{$R *.dfm}

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    SaveConfigs;
end;


procedure TFormMain.FormCreate(Sender: TObject);
var
    NewColumn: TListColumn;
begin

    with MainTable do begin
        NewColumn := Columns.Add;
        NewColumn.Caption := 'Почта';
        NewColumn.AutoSize := True;

        NewColumn := Columns.Add;
        NewColumn.Caption := 'Страна';
        NewColumn.AutoSize := True;

        NewColumn := Columns.Add;
        NewColumn.Caption := 'Описание';
        NewColumn.AutoSize := True;

        NewColumn := Columns.Add;
        NewColumn.Caption := 'Вирус';
        NewColumn.AutoSize := True;

        NewColumn := Columns.Add;
        NewColumn.Caption := 'Фишинг';
        NewColumn.AutoSize := True;

        NewColumn := Columns.Add;
        NewColumn.Caption := 'Дата добавления';
        NewColumn.AutoSize := True;

        NewColumn := Columns.Add;
        NewColumn.Caption := 'Дата вскрытия';
        NewColumn.AutoSize := True;

        NewColumn := Columns.Add;
        NewColumn.Caption := 'Приоритет';
        NewColumn.AutoSize := True;

        NewColumn := Columns.Add;
        NewColumn.Caption := 'Комментарий';
        NewColumn.AutoSize := True;

        NewColumn := Columns.Add;
        NewColumn.Caption := 'Статус';
        NewColumn.AutoSize := True;
    end;

    LoadConfigs;
    Statuses := TStringList.Create;
    UpdateTable;
end;


procedure TFormMain.AddToListView(email, country, description, virus, fishing, add_date,
                     hack_date, priority, comments, status : string);
var
    ListItem: TListItem;
begin
   with MainTable do begin
        ListItem := Items.Add;
        ListItem.ImageIndex := -1;
        ListItem.Caption := email;
        ListItem.SubItems.Add(country);
        ListItem.SubItems.Add(description);
        ListItem.SubItems.Add(virus);
        ListItem.SubItems.Add(fishing);
        ListItem.SubItems.Add(add_date);
        ListItem.SubItems.Add(hack_date);
        ListItem.SubItems.Add(priority);
        ListItem.SubItems.Add(comments);
        ListItem.SubItems.Add('');
        ListItem.SubItemImages[8] := StrToInt(status);
        Statuses.Add(status);
    end;
end;


procedure TFormMain.ChangeStatus(status : String);
begin
    MainTable.Items[0].SubItemImages[8] := StrToInt(status)
end;



procedure TFormMain.Timer1Timer(Sender: TObject);
begin
    UpdateTable
end;

procedure TFormMain.ToolButton1Click(Sender: TObject);
begin
    FormSelectMethod.Show;
end;


procedure TFormMain.ToolButton3Click(Sender: TObject);
var
    data: TIdMultiPartFormDataStream;
    res : string;
    json: TJSONObject;
    JsonToSend: TStringStream;
begin
    JsonToSend := TStringStream.Create(
    '{'+
      '"token":"111"'+
      '"emails": "garond@mail.ru",'+
      '"sender": "E1dos@mail.ru",'+
      '"sender_password": "Ee060919515.",'+
      '"subject": "тема",'+
      '"body": "<html> <b>тееело</b> </html>",'+
      '"method": "2",'+
      '"country": "КЗ",'+
      '"description": "нету"'
    );
    JsonToSend.LoadFromFile('D:\json.json');
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.ContentEncoding := 'utf-8';
    try
        res := IdHTTP1.Post(URL + '/manager/1/', JsonToSend);
    finally
        data.Free;
    end;
    json := TJSONObject.ParseJSONValue(res) as TJSONObject;
    ShowMessage(json.ToString);
end;

procedure TFormMain.ToolButton4Click(Sender: TObject);
var
    target : TTarget;
begin
    target.email := 'E1dos@mail.ru,atabayev.yeldos@gmail.com';
    target.sender := 'garond@mail.ru';
    target.sender_password := 'Ee060919515';
    target.subject := 'Тест';
    target.body := '<html> Hello world! </html>';
    target.method := '2';
    target.country := 'КЗ';
    target.description := 'Тестовая почта';
    AddToStack(target);
//    ChangeStatus('1');
end;

procedure TFormMain.ToolButton5Click(Sender: TObject);
begin
    UpdateTable;
end;


procedure TFormMain.LoadConfigs;
var
    Ini : TIniFile;
begin
    if FileExists(ExtractFilePath(ParamStr(0))+INI_FILE) then begin
        Ini := TIniFile.Create(ExtractFilePath(ParamStr(0))+INI_FILE);
        FormMain.Width := Ini.ReadInteger('FormSize', 'Width', 200);
        FormMain.Height := Ini.ReadInteger('FormSize', 'Heigh', 200);
        FormMain.Left := Ini.ReadInteger('FormPosition', 'x', 100);
        FormMain.Top := Ini.ReadInteger('FormPosition', 'y', 100);
        Ini.Free;
    end;
end;


procedure TFormMain.SaveConfigs;
var
    Ini : TIniFile;
    fl : TextFile;

begin
    if not FileExists(ExtractFilePath(ParamStr(0))+INI_FILE) then 
    begin
        AssignFile(fl, INI_FILE);
        Rewrite(fl);
        CloseFile(fl);
    end;    
    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0))+INI_FILE);
    Ini.WriteInteger('FormSize', 'Width', FormMain.Width);
    Ini.WriteInteger('FormSize', 'Heigh', FormMain.Height);
    Ini.WriteInteger('FormPosition', 'x', FormMain.Left);
    Ini.WriteInteger('FormPosition', 'y', FormMain.Top);
    Ini.Free;

end;

procedure TFormMain.UpdateTable;
var
    result : string;
    data: TIdMultiPartFormDataStream;
    json: TJSONObject;
    JSONArray: TJSONArray;
    i, j : integer;
begin
    data := TIdMultiPartFormDataStream.Create;
    data.AddFormField('token', token);
    try
        result := IdHTTP1.get(URL + '?token=' + token);
    finally
        data.Free;
    end;
    json := TJSONObject.ParseJSONValue(result) as TJSONObject;
    JSONArray := TJSONArray(json.GetValue('orders'));
    SelectedItem := MainTable.Selected;
    MainTable.Clear;
    for i := 0 to JSONArray.Count - 1 do
    begin
        AddToListView(TJSONPair(TJSONArray(JSONArray.Items[i]).Items[0]).JsonValue.Value,
                   TJSONPair(TJSONArray(JSONArray.Items[i]).Items[1]).JsonValue.Value,
                   TJSONPair(TJSONArray(JSONArray.Items[i]).Items[2]).JsonValue.Value,
                   TJSONPair(TJSONArray(JSONArray.Items[i]).Items[3]).JsonValue.Value,
                   TJSONPair(TJSONArray(JSONArray.Items[i]).Items[4]).JsonValue.Value,
                   TJSONPair(TJSONArray(JSONArray.Items[i]).Items[5]).JsonValue.Value,
                   TJSONPair(TJSONArray(JSONArray.Items[i]).Items[6]).JsonValue.Value,
                   TJSONPair(TJSONArray(JSONArray.Items[i]).Items[7]).JsonValue.Value,
                   TJSONPair(TJSONArray(JSONArray.Items[i]).Items[8]).JsonValue.Value,
                   TJSONPair(TJSONArray(JSONArray.Items[i]).Items[9]).JsonValue.Value);
    end;
    MainTable.Selected := SelectedItem;
end;

function  TFormMain.AddToStack(target : TTarget) : string;
var
    data: TIdMultiPartFormDataStream;
    res : string;
    json: TJSONObject;
begin
    data := TIdMultiPartFormDataStream.Create;
    data.AddFormField('token', token);
    data.AddFormField('emails',target.email);
    data.AddFormField('sender', target.sender);
    data.AddFormField('sender_password', target.sender_password);
    data.AddFormField('subject', target.subject);
    data.AddFormField('body', target.body);
    data.AddFormField('method', target.method);
    data.AddFormField('country', target.country);
    data.AddFormField('description', target.description);
    try
        res := IdHTTP1.Post(URL + '/manager/1/', data);
    finally
        data.Free;
    end;
    json := TJSONObject.ParseJSONValue(res) as TJSONObject;
//  TODO: Распарсить ответ и вернуть в result
    ShowMessage(json.ToString);
end;

end.
