unit uStrategy;

interface

type
    { 策略接口 }
    IStrategy = interface(IUnKnown)
        ['{A6717E14-2D81-41B9-AE7A-5F241F78E530}']
        // 制定策略
        function doOperation(num1, num2: Integer): Integer;
    end;

    // 策略的具体实现方式一
    TOperationAdd = class(TInterfacedObject, IStrategy)
    public
        function doOperation(num1, num2: Integer): Integer;
    end;

    // 策略的具体实现方式二
    TOperationSubtract = class(TInterfacedObject, IStrategy)
    public
        function doOperation(num1, num2: Integer): Integer;
    end;

    // 真正使用策略的类
    TOperation = class(TObject)
    public
        // Strategy:策略的类型需要使用接口类型，这样传任意的策略接口实现类即可
        function ExecuteStrategy(num1, num2: Integer; Strategy: IStrategy): Integer;
    end;

implementation

{ TOperationAdd }

function TOperationAdd.doOperation(num1, num2: Integer): Integer;
begin
    Result := num1 + num2;
end;
{ TOperationSubtract }

function TOperationSubtract.doOperation(num1, num2: Integer): Integer;
begin
    Result := num1 - num2;
end;

{ TOperation }
function TOperation.ExecuteStrategy(num1, num2: Integer; Strategy: IStrategy): Integer;
begin
    Result := Strategy.doOperation(num1, num2);

end;

end.
