unit BuilderMode2;

interface

type
    TComputer = class
    private
        // 必须 CUP
        FCpu: string;
        // 必须 内存
        FRam: string;
        // 可选    USB数量
        FUsbCount: Integer;
        // 可选   键盘
        FKeyboard: string;
        // 可选   显示器
        FDisplay: string;

    public
        property Cpu: string read FCpu write FCpu;

        property Ram: string read FRam write FRam;

        property UsbCount: Integer read FUsbCount write FUsbCount;

        property Keyboard: string read FKeyboard write FKeyboard;

        property Display: string read FDisplay write FDisplay;

        constructor Create(Cpu: string; Ram: string); overload;
    end;

    TComputerBuilder = class

    public

        procedure SetUsbCount(); virtual; abstract;

        procedure SetKeyboard(); virtual; abstract;

        procedure SetDisplay(); virtual; abstract;

        function GetComputer(): TComputer; virtual; abstract;
    end;

    TMacComputerBuilder = class(TComputerBuilder)
    private
        FComputer: TComputer;
    public

        constructor Create(Cpu: string; Ram: string); overload;

        procedure SetUsbCount(); override;

        procedure SetKeyboard(); override;

        procedure SetDisplay(); override;

        function GetComputer(): TComputer; override;
    end;

    TComputerDirector = class

        procedure MakeComputer(ComputerBuilder: TComputerBuilder);
    end;

implementation

{ TMacComputerBuilder }

constructor TMacComputerBuilder.Create(Cpu, Ram: string);
begin
    // 创建计算机对象，填充必须的参数
    FComputer := TComputer.Create(Cpu, Ram);
end;

function TMacComputerBuilder.GetComputer: TComputer;
begin
    Result := FComputer;
end;

procedure TMacComputerBuilder.SetDisplay;
begin
    FComputer.Display := '苹果显示器';
end;

procedure TMacComputerBuilder.SetKeyboard;
begin
    FComputer.Keyboard := '苹果键盘';
end;

procedure TMacComputerBuilder.SetUsbCount;
begin
    FComputer.UsbCount := 2;
end;

{ TComputer }

constructor TComputer.Create(Cpu, Ram: string);
begin
    self.FCpu := Cpu;
    self.Ram := Ram;
end;

{ TComputerDirector }

procedure TComputerDirector.MakeComputer(ComputerBuilder: TComputerBuilder);
begin
    ComputerBuilder.SetUsbCount();
    ComputerBuilder.SetDisplay();
    ComputerBuilder.SetKeyboard();
end;

end.
