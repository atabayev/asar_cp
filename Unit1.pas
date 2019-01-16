unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.ExtCtrls, Vcl.Imaging.pngimage, IniFiles,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdMultipartFormData,
  System.JSON, Vcl.StdCtrls, Unit3, IdURI;

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
    body_name: string;
    method: string;
    country: string;
    description: string;
    comment: string;
    host: string;
    user: string;
    pswd: string;
  end;

  TFormMain = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Image1: TImage;
    MainTable: TListView;
    StatusesImageList: TImageList;
    IdHTTP1: TIdHTTP;
    Timer1: TTimer;
    pLoadTemplate: TPanel;
    ldTemplateName: TLabeledEdit;
    Label1: TLabel;
    mmDescriotion: TMemo;
    Button1: TButton;
    Panel2: TPanel;
    Button2: TButton;
    Button3: TButton;
    FileOpenDialog: TFileOpenDialog;
    lPathToTemplate: TLabel;
    mmTmp: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadConfigs;
    procedure SaveConfigs;
    procedure AddToListView(email, country, description, method, virus, fishing, add_date,
                         hack_date, comments, status : string);
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
        NewColumn.Caption := 'Метод';
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


procedure TFormMain.AddToListView(email, country, description, method, virus, fishing, add_date,
                     hack_date, comments, status : string);
var
    ListItem: TListItem;
begin
   with MainTable do begin
        ListItem := Items.Add;
        ListItem.ImageIndex := -1;
        ListItem.Caption := email;
        ListItem.SubItems.Add(country);
        ListItem.SubItems.Add(description);
        ListItem.SubItems.Add(method);
        ListItem.SubItems.Add(virus);
        ListItem.SubItems.Add(fishing);
        ListItem.SubItems.Add(add_date);
        ListItem.SubItems.Add(hack_date);
        ListItem.SubItems.Add(comments);
        ListItem.SubItems.Add('');
        ListItem.SubItemImages[7] := StrToInt(status);
        Statuses.Add(status);
    end;
end;




procedure TFormMain.Timer1Timer(Sender: TObject);
begin
    UpdateTable;
end;

procedure TFormMain.ToolButton1Click(Sender: TObject);
begin
    FormAddEmails.Show;
end;



procedure TFormMain.ToolButton5Click(Sender: TObject);
begin
    pLoadTemplate.Visible := true;
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
    result,
    mth : string;
    data: TIdMultiPartFormDataStream;
    json: TJSONObject;
    JSONArray: TJSONArray;
    i : integer;
begin
    data := TIdMultiPartFormDataStream.Create;
    data.AddFormField('token', token, 'utf-8').ContentTransfer := '8bit';
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
        if TJSONPair(TJSONArray(JSONArray.Items[i]).Items[3]).JsonValue.Value = '1' then
            mth := 'Фишинг';
        if TJSONPair(TJSONArray(JSONArray.Items[i]).Items[3]).JsonValue.Value = '2' then
            mth := 'Вирус';
        if TJSONPair(TJSONArray(JSONArray.Items[i]).Items[3]).JsonValue.Value = '3' then
            mth := 'Вирус+Фишинг';
        AddToListView(TJSONPair(TJSONArray(JSONArray.Items[i]).Items[0]).JsonValue.Value,
                   TJSONPair(TJSONArray(JSONArray.Items[i]).Items[1]).JsonValue.Value,
                   TJSONPair(TJSONArray(JSONArray.Items[i]).Items[2]).JsonValue.Value,
                   mth,
//                   TJSONPair(TJSONArray(JSONArray.Items[i]).Items[3]).JsonValue.Value,
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
    data.AddFormField('token', token, 'utf-8').ContentTransfer := '8bit';
    data.AddFormField('emails',target.email, 'utf-8').ContentTransfer := '8bit';
    data.AddFormField('sender', target.sender, 'utf-8').ContentTransfer := '8bit';
    data.AddFormField('sender_password', target.sender_password, 'utf-8');
    data.AddFormField('subject', target.subject, 'utf-8').ContentTransfer := '8bit';
    data.AddFormField('body_name', target.body_name, 'utf-8').ContentTransfer := '8bit';
    data.AddFormField('method', target.method, 'utf-8').ContentTransfer := '8bit';
    data.AddFormField('country', target.country, 'utf-8').ContentTransfer := '8bit';
    data.AddFormField('description', target.description, 'utf-8').ContentTransfer := '8bit';
    data.AddFormField('host', target.host, 'utf-8').ContentTransfer := '8bit';
    data.AddFormField('user', target.user, 'utf-8').ContentTransfer := '8bit';
    data.AddFormField('pswd', target.pswd, 'utf-8').ContentTransfer := '8bit';
    try
        res := IdHTTP1.Post(URL + '/manager/1/', data);
    finally
        data.Free;
    end;
    json := TJSONObject.ParseJSONValue(res) as TJSONObject;
    ShowMessage(json.GetValue('response').Value);
end;

procedure TFormMain.Button1Click(Sender: TObject);
begin
    if FileOpenDialog.Execute then begin
        lPathToTemplate.Caption := FileOpenDialog.FileName;
        mmTmp.Lines.LoadFromFile(lPathToTemplate.Caption, TEncoding.UTF8);
    end;
end;

procedure TFormMain.Button2Click(Sender: TObject);
var
    data: TIdMultiPartFormDataStream;
    result : string;
    json: TJSONObject;
    TemplateText : string;
begin
    data := TIdMultiPartFormDataStream.Create;
    data.AddFormField('token', token, 'utf-8').ContentTransfer:='8bit';
    data.AddFormField('name',ldTemplateName.Text, 'utf-8').ContentTransfer:='8bit';
    data.AddFormField('description', mmDescriotion.Text, 'utf-8').ContentTransfer:='8bit';
    data.AddFormField('template', mmTmp.Text, 'utf-8').ContentTransfer:='8bit';
    try
        result := IdHTTP1.Post(URL + '/manager/load_template/', data);
    finally
        data.Free;
    end;
    json := TJSONObject.ParseJSONValue(result) as TJSONObject;
    if (json.GetValue('response').Value = 'ok') then
        ShowMessage('Шаблон добавлен');
    pLoadTemplate.Visible := false;
    ldTemplateName.Clear;
    mmDescriotion.Clear;
    lPathToTemplate.Caption := '';
end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
    pLoadTemplate.Visible := false;
    ldTemplateName.Clear;
    mmDescriotion.Clear;
    lPathToTemplate.Caption := '';
end;

end.
