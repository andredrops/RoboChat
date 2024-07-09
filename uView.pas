unit uView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  uRoboChatView;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    RichEdit1: TRichEdit;
    Image2: TImage;
    Panel1: TPanel;
    procedure Image2Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel1MouseEnter(Sender: TObject);
    procedure Panel1MouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FRoboChat: TRoboChatView;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FRoboChat := TRoboChatView.New();
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  FRoboChat.IniciarAssistente(Self);
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  Image1.Visible := True;
  Image2.Visible := False;
  Panel1.Visible := True;

  Label1.Visible := True;
  Shape1.Visible := True;
  Shape2.Visible := True;
  RichEdit1.Visible := True;
end;

procedure TForm1.Image2MouseEnter(Sender: TObject);
begin
  TImage(Sender).Top := TImage(Sender).Top - 30;
  TImage(Sender).Left := TImage(Sender).Left - 30;
  TImage(Sender).Height := TImage(Sender).Height + 30;
  TImage(Sender).Width := TImage(Sender).Width + 30;
end;

procedure TForm1.Image2MouseLeave(Sender: TObject);
begin
  TImage(Sender).Top := TImage(Sender).Top + 30;
  TImage(Sender).Left := TImage(Sender).Left + 30;
  TImage(Sender).Height := TImage(Sender).Height - 30;
  TImage(Sender).Width := TImage(Sender).Width - 30;
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin
  Image1.Visible := False;
  Image2.Visible := True;
  Panel1.Visible := False;

  Label1.Visible := False;
  Shape1.Visible := False;
  Shape2.Visible := False;
  RichEdit1.Visible := False;
end;

procedure TForm1.Panel1MouseEnter(Sender: TObject);
begin
  TPanel(Sender).Color := clRed;
  TPAnel(Sender).Font.Color := clWhite;
end;

procedure TForm1.Panel1MouseLeave(Sender: TObject);
begin
  TPanel(Sender).Color := clBtnFace;
  TPAnel(Sender).Font.Color := clBlack;
end;

end.
