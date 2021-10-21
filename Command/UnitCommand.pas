unit UnitCommand;

interface

type
    // 接收者：真正执行命令的对象
    TReceiver = class
    public
        procedure Action();
    end;

    // 命令的抽象类,用接口更好
    TCommand = class abstract

    public
        // 调用命令
        procedure execute(); virtual; abstract;
    end;

    // 具体命令
    TConcreteCommand = class(TCommand)
    private
        FReceiver: TReceiver;
    public
        property Receiver: TReceiver read FReceiver write FReceiver;
        // 重写
        procedure execute(); override;
        // 构造
        constructor Create(Receiver: TReceiver); overload;
    end;

    // 请求者/调用者：发起执行命令请求的对象
    TInvoker = class
    private
        FCommand: TCommand;
    public
        constructor Create(Command: TCommand); overload;

        procedure Call();
    end;

implementation

{ TReceiver }

procedure TReceiver.Action;
begin
    Writeln('命令执行了');
end;

{ TConcreteCommand }

constructor TConcreteCommand.Create(Receiver: TReceiver);
begin
    self.FReceiver := Receiver;
end;

procedure TConcreteCommand.execute;
begin
    Receiver.Action();
end;

{ TInvoker }

procedure TInvoker.Call;
begin
    // 请求者调用命令对象执行命令的那个execute方法
    FCommand.execute();
end;

constructor TInvoker.Create(Command: TCommand);
begin
    self.FCommand := Command;
end;

end.
