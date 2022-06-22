program Facade;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UnitFacade in 'UnitFacade.pas';

begin
  try
    TSociety.Create.Marry('Ð¡Ç¿', 'Ð¡°×');
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.

