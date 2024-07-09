program RoboChat;

uses
  Vcl.Forms,
  uView in 'uView.pas' {Form1},
  uRoboChatView in 'uRoboChatView.pas' {RoboChatView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
