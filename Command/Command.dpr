program Command;

{$APPTYPE CONSOLE}
{$R *.res}

// 命令模式
uses
    System.SysUtils,
    UnitCommand in 'UnitCommand.pas',
    UnitOrderingFood in 'UnitOrderingFood.pas';

procedure Demo1();
begin
    // 通过请求者（invoker）调用命令对象（command），命令对象中调用了命令具体执行者（Receiver）
    var
    ConcreteCommand := TConcreteCommand.Create(TReceiver.Create());
    var
    Invoker := TInvoker.Create(ConcreteCommand);

    Invoker.Call;
end;

begin
    try
        // 选择菜品(构建命令并指定命令的接收者)
        var
        WontonCommand := TWontonCommand.Create(TWontonReceiver.Create);
        var
        DumplingsCommand := TDumplingsCommand.Create(TDumplingsReceiver.Create);
        // 服务员生成菜单
        var
        FoodInvoker := TFoodInvoker.Create();
        FoodInvoker.SetFoodCommand(WontonCommand);
        FoodInvoker.SetFoodCommand(DumplingsCommand);
        // 大师傅开始做菜
        FoodInvoker.Execute();
    except
        on E: Exception do Writeln(E.ClassName, ': ', E.Message);
    end;
    Readln;

end.
