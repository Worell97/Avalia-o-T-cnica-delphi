program Project1;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  cadastroAluno in 'cadastros\CadastroAluno\cadastroAluno.pas' {FCadastroAluno},
  cadastroProfessor in 'cadastros\CadastroProfessor\cadastroProfessor.pas' {FCadastroProfessor},
  uCalculo in 'classesBase\uCalculo.pas',
  ICalculo in 'classesBase\ICalculo.pas',
  IController.Cadastros in 'classesBase\IController.Cadastros.pas',
  IPadraoDAO in 'classesBase\IPadraoDAO.pas',
  DAO.Cad_Alunos in 'cadastros\CadastroAluno\DAO.Cad_Alunos.pas',
  DTO.Cad_Alunos in 'cadastros\CadastroAluno\DTO.Cad_Alunos.pas',
  DAO.Cad_Professor in 'cadastros\CadastroProfessor\DAO.Cad_Professor.pas',
  DTO.Cad_Professor in 'cadastros\CadastroProfessor\DTO.Cad_Professor.pas',
  DAO.Cad_Notas in 'cadastros\CadastroNotas\DAO.Cad_Notas.pas',
  DTO.Cad_Notas in 'cadastros\CadastroNotas\DTO.Cad_Notas.pas',
  CadastrosNotas in 'cadastros\CadastroNotas\CadastrosNotas.pas' {FCadastroNotas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFCadastroAluno, FCadastroAluno);
  Application.CreateForm(TFCadastroProfessor, FCadastroProfessor);
  Application.CreateForm(TFCadastroNotas, FCadastroNotas);
  Application.Run;
end.
