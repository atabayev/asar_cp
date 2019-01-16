unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.OleCtrls, SHDocVw, UnitSelectTemplate, Vcl.Buttons, Vcl.ValEdit, Vcl.CategoryButtons;

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

  TFormAddEmails = class(TForm)
    Panel1: TPanel;
    btnAddToStack: TButton;
    lvQueue: TListView;
    OpenDialog1: TOpenDialog;
    pCategory: TPanel;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    Label4: TLabel;
    Label5: TLabel;
    edSendersEmail: TEdit;
    edSendersEmPswd: TEdit;
    CategoryPanel2: TCategoryPanel;
    Panel3: TPanel;
    Button3: TButton;
    Panel4: TPanel;
    Button2: TButton;
    Label7: TLabel;
    edEmail: TEdit;
    Label8: TLabel;
    cbMethod: TComboBox;
    edSubject: TEdit;
    Label9: TLabel;
    edCounytry: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    CategoryPanel3: TCategoryPanel;
    Label12: TLabel;
    mmDescription: TMemo;
    mmComment: TMemo;
    Label13: TLabel;
    CategoryPanel4: TCategoryPanel;
    edFtpHost: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    edFtpUser: TEdit;
    edFtpPswd: TEdit;
    Label16: TLabel;
    btnSelectTemplate: TButton;
    edTemplate: TEdit;
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
    procedure Edit(trg: TTarget);
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

procedure TFormAddEmails.Edit(trg: TTarget);
begin

end;


procedure TFormAddEmails.btnAddToStackClick(Sender: TObject);
var
    ListItem: TListItem;
    i : integer;
    target: unit1.TTarget;
begin
    for i := 0 to lvQueue.Items.Count-1 do
    with FormMain.MainTable do begin
        target.email := lvQueue.Items.Item[i].Caption;
        target.sender := lvQueue.Items.Item[i].SubItems.Strings[0];
        target.sender_password := lvQueue.Items.Item[i].SubItems.Strings[1];
        target.subject := lvQueue.Items.Item[i].SubItems.Strings[2];
        target.body_name := edTemplate.Text;
        target.method := IntToStr(cbMethod.ItemIndex + 1);
        target.country := lvQueue.Items.Item[i].SubItems.Strings[5];
        target.description := lvQueue.Items.Item[i].SubItems.Strings[6];
        target.host := edFtpHost.Text;
        target.user := edFtpUser.Text;
        target.pswd := edFtpPswd.Text;
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
        ListItem.Caption := edEmail.Text;
        ListItem.SubItems.Add(edSendersEmail.Text);
        ListItem.SubItems.Add(edSendersEmPswd.Text);
        ListItem.SubItems.Add(edSubject.Text);
        ListItem.SubItems.Add(edTemplate.Text);
        ListItem.SubItems.Add(cbMethod.Text);
        ListItem.SubItems.Add(edCounytry.Text);
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
end;

procedure TFormAddEmails.FormShow(Sender: TObject);
begin
    lvQueue.Clear;
end;

end.
