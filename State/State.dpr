program State;

{$APPTYPE CONSOLE}

{$R *.res}

uses
    System.SysUtils,
    UnitState in 'UnitState.pas';

begin



    try
        var Context := TContext.Create();
        //获取默认状态
        Writeln(Context.GetWeather());
        //切换状态
        Context.CurrentWeather := TSunshine.Create();
        //获取切换后的状态
        Writeln(Context.GetWeather());

    except
        on E: Exception do
            Writeln(E.ClassName, ': ', E.Message);
    end;
    Readln;
end.

