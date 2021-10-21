program Factory;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils,
    UnitLogger in 'UnitLogger.pas';

begin
    try
        var
        Logger := TLoggerFactory.GetLogger(1);
        Logger.log();
    except
        on E: Exception do Writeln(E.ClassName, ': ', E.Message);
    end;
    readln;

end.
