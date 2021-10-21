program BuilderMode;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils,
    // BuilderModeCore in 'BuilderModeCore.pas',
    BuilderMode2 in 'BuilderMode2.pas';

// var
// MacComputer: TComputer;

begin
    // MacComputer := TComputer.TBuilder.Create('因特尔', '三星').SetUsbCount(2)
    // .SetKeyboard('Mac').Build;

    var
    Director := TComputerDirector.Create(); // 1

    var
    builder := TMacComputerBuilder.Create('I5处理器', '三星125'); // 2

    Director.MakeComputer(builder); // 3
    var
    MacComputer := builder.GetComputer(); // 4

    Readln;

end.
