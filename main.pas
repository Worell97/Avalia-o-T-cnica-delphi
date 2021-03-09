unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, Vcl.StdCtrls, cadastroAluno, cadastroProfessor;

type
  TForm1 = class(TForm)
    BtnAluno: TButton;
    BtnProfessor: TButton;
    procedure BtnAlunoClick(Sender: TObject);
    procedure BtnProfessorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnAlunoClick(Sender: TObject);
var
  LCadastroAluno: TFCadastroAluno;
begin
  LCadastroAluno := TFCadastroAluno.Create(self);
  LCadastroAluno.ShowModal;
end;

procedure TForm1.BtnProfessorClick(Sender: TObject);
var
  LCadastroProfessor: TFCadastroProfessor;
begin
  LCadastroProfessor := TFCadastroProfessor.Create(self);
  LCadastroProfessor.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//
end;

end.


