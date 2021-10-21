unit UnitOrderingFood;

interface

uses System.Generics.Collections;

type
    // 餐品指令
    TFoodCommand = class abstract
    public
        // 餐品的制作方法，因为每一种都不同所以为抽象
        procedure Make(); virtual; abstract;
    end;

    // 命令的接收者（命令的执行者）水饺师
    TDumplingsReceiver = class
    public
        procedure Action();
    end;

    // 馄饨师（虽然不知道有没有这种职业）
    TWontonReceiver = class
    public
        procedure Action();
    end;

    // 具体餐品指令水饺
    TDumplingsCommand = class(TFoodCommand)
    private
        FDumplingsReceiver: TDumplingsReceiver;
    public
        procedure Make(); override;
        constructor Create(DumplingsReceiver: TDumplingsReceiver); overload;
    end;

    // 具体餐品指令馄饨
    TWontonCommand = class(TFoodCommand)
    private
        FWontonReceiver: TWontonReceiver;
    public
        procedure Make(); override;
        constructor Create(WontonReceiver: TWontonReceiver); overload;
    end;

    TFoodInvoker = class
    private
        // 指令集，可以理解为菜单
        FFoodCommands: TList<TFoodCommand>;
    public
        // 添加到指令集中
        procedure SetFoodCommand(FoodCommand: TFoodCommand);
        // 执行指令集中的指令
        procedure Execute();
        // 初始化指令集
        constructor Create(); overload;
    end;

implementation

{ TDumplings }

constructor TDumplingsCommand.Create(DumplingsReceiver: TDumplingsReceiver);
begin
    self.FDumplingsReceiver := DumplingsReceiver;
end;

procedure TDumplingsCommand.Make;
begin
    Writeln('手工水饺');
    self.FDumplingsReceiver.Action();
end;
{ TWonton }

constructor TWontonCommand.Create(WontonReceiver: TWontonReceiver);
begin
    self.FWontonReceiver := WontonReceiver;
end;

procedure TWontonCommand.Make;
begin
    Writeln('皮薄馅大金牌馄饨');
    self.FWontonReceiver.Action();
end;
{ TDumplingsReceiver }

procedure TDumplingsReceiver.Action;
begin
    Writeln('和面');
    Writeln('调馅');
    Writeln('制成');
end;

{ TWontonReceiver }

procedure TWontonReceiver.Action;
begin
    Writeln('和面');
    Writeln('调馅');
    Writeln('擀皮');
end;

{ TFoodInvoker }

constructor TFoodInvoker.Create;
begin
    FFoodCommands := TList<TFoodCommand>.Create();
end;

procedure TFoodInvoker.Execute;
begin
    for var FoodCommand in FFoodCommands do begin
        FoodCommand.Make();
    end;
end;

procedure TFoodInvoker.SetFoodCommand(FoodCommand: TFoodCommand);
begin
    FFoodCommands.Add(FoodCommand);
end;

end.
