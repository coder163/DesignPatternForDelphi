program TemplateMethod;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils;

type
    { 定义冰箱类 }
    TRefrigerator = class
    Protected

        { 打开冰箱 }
        procedure Open(); virtual; abstract;
        { 存放东西 }
        procedure Deposit(); virtual; abstract;
        { 关闭冰箱 }
        procedure Close(); virtual; abstract;
        { 模板方法，向冰箱中存放东西 }
        procedure DepositToRefrigerator();

    end;

    { 定义冰箱的子类海尔冰箱 }
    THaierRefrigerator = class(TRefrigerator)
        procedure Open(); override;

        procedure Deposit(); override;

        procedure Close(); override;
    end;
    { TRefrigerator }

procedure TRefrigerator.DepositToRefrigerator;
begin
    // 存放东西的整体流程
    Open();
    Deposit();
    Close()
end;

{ THaierRefrigerator }

procedure THaierRefrigerator.Close;
begin
    Writeln('Haier冰箱关闭');
end;

procedure THaierRefrigerator.Deposit;
begin
    Writeln('Haier冰箱存放');
end;

procedure THaierRefrigerator.Open;
begin
    Writeln('Haier冰箱打开');
end;

begin

    //创建子类对象
    var
    HaierRefrigerator := THaierRefrigerator.Create();

    //调用模板方法
    HaierRefrigerator.DepositToRefrigerator();

    Readln;

end.
