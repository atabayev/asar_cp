unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.OleCtrls, SHDocVw, UnitSelectTemplate;

type
  TFormAddEmails = class(TForm)
    Panel1: TPanel;
    btnAddToStack: TButton;
    lvQueue: TListView;
    Panel2: TPanel;
    Button2: TButton;
    Panel3: TPanel;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    tmpMemo: TMemo;
    Label6: TLabel;
    cbTemplate: TComboBox;
    btnSelectTemplate: TButton;
    ledEmail: TLabeledEdit;
    ledSendersEmail: TLabeledEdit;
    ledSendersEmPswd: TLabeledEdit;
    ledSubject: TLabeledEdit;
    ledCounytry: TLabeledEdit;
    mmDescription: TMemo;
    Label1: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    LabeledEdit1: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ReadDataFromFile(FileName : string);
    procedure btnAddToStackClick(Sender: TObject);
    procedure btnSelectTemplateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Start(Mtd : ShortInt; Template : String);
    { Public declarations }
  end;

var
  FormAddEmails: TFormAddEmails;
  AttackMethod : ShortInt;
  PathToTemplate : String;
  vir, fish : string;
  method: string;
  methodCode: string;

implementation
uses unit1;

{$R *.dfm}


procedure TFormAddEmails.Start(Mtd : ShortInt; Template : String);
begin
    PathToTemplate := Template;
    case Mtd of
            1: begin
                fish := '+';
                vir := '-';
                method := 'Фишинг';
                methodCode := '1';
            end;
            2: begin
                fish := '-';
                vir := '+';
                method := 'Вирус';
                methodCode := '2';
            end;
            3: begin
                fish := '+';
                vir := '+';
                method := 'Фишинг + Вирус';
                methodCode := '3';
            end;
        end;
end;

procedure TFormAddEmails.btnAddToStackClick(Sender: TObject);
var
    ListItem: TListItem;
    i : integer;
    target: TTarget;
begin
    for i := 0 to lvQueue.Items.Count-1 do
    with FormMain.MainTable do begin
        target.email := lvQueue.Items.Item[i].Caption;
        target.sender := lvQueue.Items.Item[i].SubItems.Strings[0];
        target.sender_password := lvQueue.Items.Item[i].SubItems.Strings[1];
        target.subject := lvQueue.Items.Item[i].SubItems.Strings[2];

        tmpMemo.Lines.LoadFromFile('D:\Templates\' +
                                   lvQueue.Items.Item[i].SubItems.Strings[3]);
        target.body := tmpMemo.Text;
//        target.body := lvQueue.Items.Item[i].SubItems.Strings[3]; //TODO: Добавить текст html

        target.method := methodCode;
        target.country := lvQueue.Items.Item[i].SubItems.Strings[5];
        target.description := lvQueue.Items.Item[i].SubItems.Strings[6];
        FormMain.AddToStack(target);
    end;
    FormAddEmails.Close;
end;

procedure TFormAddEmails.btnSelectTemplateClick(Sender: TObject);
begin
    FormSelectTemplate.Show;
end;

procedure TFormAddEmails.Button2Click(Sender: TObject);
var
    ListItem: TListItem;
begin
    with lvQueue do begin
        ListItem := Items.Add;
        ListItem.Caption := ledEmail.Text;
        ListItem.SubItems.Add(ledSendersEmail.Text);
        ListItem.SubItems.Add(ledSendersEmPswd.Text);
        ListItem.SubItems.Add(ledSubject.Text);
        ListItem.SubItems.Add(cbTemplate.Text);
        ListItem.SubItems.Add(method);
        ListItem.SubItems.Add(ledCounytry.Text);
        ListItem.SubItems.Add(mmDescription.Text);
    end;
;end;

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
begin

end;

procedure TFormAddEmails.ReadDataFromFile(FileName : string);
var
    i : integer;
    tmpStr : string;
    OutPutList: TStringList;
begin

end;

procedure TFormAddEmails.Button3Click(Sender: TObject);
begin
    if OpenDialog1.Execute then begin
        ReadDataFromFile(OpenDialog1.FileName);
    end;
end;

procedure TFormAddEmails.FormCreate(Sender: TObject);
var
    NewColumn: TListColumn;
    OnePercentOfWidth: Integer;
begin
    OnePercentOfWidth := lvQueue.Width div 100;
    lvQueue.Clear;
    with lvQueue do begin
        NewColumn := Columns.Add;
        NewColumn.Caption := 'Почта';
        NewColumn.AutoSize := True;
//        NewColumn.Width := OnePercentOfWidth * 13;
        NewColumn := Columns.Add;
        NewColumn.Caption := 'Отправитель';
        NewColumn.AutoSize := True;
//        NewColumn.Width := OnePercentOfWidth * 13;
        NewColumn := Columns.Add;
        NewColumn.Caption := 'Пароль отправителя';
        NewColumn.AutoSize := True;
//        NewColumn.Width := OnePercentOfWidth * 10;
        NewColumn := Columns.Add;
        NewColumn.Caption := 'Тема';
        NewColumn.AutoSize := True;
//        NewColumn.Width := OnePercentOfWidth * 16;
        NewColumn := Columns.Add;
        NewColumn.Caption := 'Шаблон';
        NewColumn.AutoSize := True;
//        NewColumn.Width := OnePercentOfWidth * 10;
        NewColumn := Columns.Add;
        NewColumn.Caption := 'Метод';
        NewColumn.AutoSize := True;
//        NewColumn.Width := OnePercentOfWidth * 7;
        NewColumn := Columns.Add;
        NewColumn.Caption := 'Страна';
        NewColumn.AutoSize := True;
//        NewColumn.Width := OnePercentOfWidth * 7;
        NewColumn := Columns.Add;
        NewColumn.Caption := 'Описание';
        NewColumn.AutoSize := True;
//        NewColumn.Width := OnePercentOfWidth * 24;
    end;
    FormAddEmails.Width := 1500;
    cbTemplate.Items.LoadFromFile('templates.txt');
    cbTemplate.ItemIndex := 0;
end;

procedure TFormAddEmails.FormShow(Sender: TObject);
begin
    lvQueue.Clear;
end;

end.
