program Strategy;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils,
    uStrategy in 'uStrategy.pas';

begin
    try
        var
        Operation := TOperation.Create();
        // 我们只需要更换不同的策略实现对象，即可完成不同的运算，而TOperation类中的代码不需要做任何更改
        var
        res := Operation.ExecuteStrategy(1, 2, TOperationAdd.Create());
        writeln(res.ToString);
        readln;
    except
        on E: Exception do writeln(E.ClassName, ': ', E.Message);
    end;

end.
