program Interpreter;

{$APPTYPE CONSOLE}
{$R *.res}

// 解释器模式
uses
    System.Generics.Collections, System.SysUtils;

type
    // 类的向前声明，因为TContext中引用了TExpression而TExpression又在TContext之后定义
    TExpression = class;

    // 待解释的上下文（或者称为内容）
    TContext = class
    private
        // 待解释内容
        FContent: String;
        FInterpretList: TList<TExpression>;
    public
        property Context: String read FContent write FContent;

        // 覆盖父类的构造
        constructor Create(); overload;

        // 添加（指定解释器）
        procedure AddInterpret(Expression: TExpression);
        // 解释器列表
        property InterpretList: TList<TExpression> read FInterpretList write FInterpretList;
    end;

    // 声明为抽象类（基础解释器），这种写法是我在一个开源项目中看到的
    TExpression = class abstract
    protected
        // 编写为虚方法，便于将来重写
        procedure Interpret(Context: TContext); virtual; abstract;
    end;

    TAdvanceExpression = class(TExpression)
    public
        // 重写核心的解释方法
        procedure Interpret(Context: TContext); override;
    end;

    // 以类图为基准的代码编写
    TSimpleExpression = class(TExpression)
    public
        // 重写核心的解释方法
        procedure Interpret(Context: TContext); override;
    end;

    { TAdvanceExpression }

procedure TAdvanceExpression.Interpret(Context: TContext);
begin
    Writeln('这是高级解析器');
end;

{ TSimpleExpression }

procedure TSimpleExpression.Interpret(Context: TContext);
begin
    Writeln('这是普通解析器');
end;

{ TContext }

procedure TContext.AddInterpret(Expression: TExpression);
begin
    InterpretList.Add(Expression);
end;

constructor TContext.Create;
begin
    inherited Create;
    InterpretList := TList<TExpression>.Create();
end;

begin
    try
        var
        Ctx := TContext.Create();
        // 组装解释器，我的理解是形成所谓的解释器树
        Ctx.AddInterpret(TSimpleExpression.Create());
        Ctx.AddInterpret(TAdvanceExpression.Create());

        // 执行解释
        for var CtxInterpret in Ctx.InterpretList do begin
            CtxInterpret.Interpret(Ctx);
        end;
    except
        on E: Exception do Writeln(E.ClassName, ': ', E.Message);
    end;
    Readln;

end.
