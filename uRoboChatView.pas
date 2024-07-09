unit uRoboChatView;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TRoboChatView = class(TForm)
    imgRoboChat: TImage;
  private
    FConteiner: TForm;
    FAssistente: TImage;
    FIcone: TImage;
    FBtnFechar: TPanel;

    procedure CriarIcone();

    procedure IconeOnMouseEnter(Sender: TOBject);
    procedure IconeOnMouseLeave(Sender: TOBject);
    procedure IconeOnMouseClick(Sender: TOBject);

    procedure CriarAssistente();

    procedure CriarBtnFechaAssistente();
    procedure FecharOnMouseEnter(Sender: TOBject);
    procedure FecharOnMouseLeave(Sender: TOBject);

  public
    procedure IniciarAssistente(const AConteiner: TForm);

    class function New(): TRoboChatView;
  end;

implementation

{$R *.dfm}

{ TRoboChatView }

procedure TRoboChatView.CriarAssistente;
begin
  if not Assigned(FAssistente) then
    FAssistente := TImage.Create(FConteiner);

  FAssistente.Parent := FConteiner;
  FAssistente.Visible := False;
  FAssistente.Picture := imgRoboChat.Picture;
  FAssistente.Center := True;
  FAssistente.Proportional := True;
  FAssistente.Height := 320;
  FAssistente.Width := 320;
  FAssistente.Top := FConteiner.Height - 420;
  FAssistente.Left := FConteiner.Width - 400;
  FAssistente.Anchors := [akRight, akBottom];

end;

procedure TRoboChatView.CriarBtnFechaAssistente;
begin
  FBtnFechar := TPanel.Create(FAssistente);
  FBtnFechar.Parent := FConteiner;
  FBtnFechar.StyleElements := [];
  FBtnFechar.Caption := 'X';

  FBtnFechar.Height  := 25;
  FBtnFechar.Width := 25;
  FBtnFechar.Visible := False;
  FBtnFechar.Font.Style := [fsBold];

  FBtnFechar.Top := FAssistente.Top - 15;
  FBtnFechar.Left := FAssistente.Left + 152;

  FBtnFechar.OnClick := IconeOnMouseClick;

end;

procedure TRoboChatView.CriarIcone;
begin
  FIcone := TImage.Create(Self);
  FIcone.Parent := FConteiner;
  FIcone.Picture := imgRoboChat.Picture;
  FIcone.Center := True;
  FIcone.Proportional := True;
  FIcone.Height := 65;
  FIcone.Width := 65;
  FIcone.Top := FConteiner.Height - 120;
  FIcone.Left := FConteiner.Width - 100;
  FIcone.Anchors := [akRight, akBottom];

  FIcone.OnMouseEnter := IconeOnMouseEnter;
  FIcone.OnMouseLeave := IconeOnMouseLeave;
  FIcone.OnClick := IconeOnMouseClick;

end;

procedure TRoboChatView.FecharOnMouseEnter(Sender: TOBject);
begin
  TPanel(Sender).Color := clRed;
  TPAnel(Sender).Font.Color := clWhite;
end;

procedure TRoboChatView.FecharOnMouseLeave(Sender: TOBject);
begin
  TPanel(Sender).Color := clBtnFace;
  TPAnel(Sender).Font.Color := clBlack;
end;

procedure TRoboChatView.IconeOnMouseClick(Sender: TOBject);
begin
  FAssistente.Visible := not FAssistente.Visible;
  FIcone.Visible := not FIcone.Visible;
  FBtnFechar.Visible := not FBtnFechar.Visible;
end;

procedure TRoboChatView.IconeOnMouseEnter(Sender: TOBject);
begin
  TImage(Sender).Top := TImage(Sender).Top - 30;
  TImage(Sender).Left := TImage(Sender).Left - 30;
  TImage(Sender).Height := TImage(Sender).Height + 30;
  TImage(Sender).Width := TImage(Sender).Width + 30;
end;

procedure TRoboChatView.IconeOnMouseLeave(Sender: TOBject);
begin
  TImage(Sender).Top := TImage(Sender).Top + 30;
  TImage(Sender).Left := TImage(Sender).Left + 30;
  TImage(Sender).Height := TImage(Sender).Height - 30;
  TImage(Sender).Width := TImage(Sender).Width - 30;
end;

procedure TRoboChatView.IniciarAssistente(const AConteiner: TForm);
begin
  FConteiner := AConteiner;
  Self.CriarIcone();
  Self.CriarAssistente();
  Self.CriarBtnFechaAssistente();
end;

class function TRoboChatView.New(): TRoboChatView;
begin
  Result := TRoboChatView.Create(Application);
end;

end.
