program Decorate;

{$APPTYPE CONSOLE}
{$R *.res}

{ 装饰设计模式 }
uses
  System.SysUtils,
  DecorateUnit in 'DecorateUnit.pas';

begin
  try

    //装饰各种特效

    var RetardDecorator := TRetardDecorator.Create(TNormalAttack.Create(120));

    var PoisonDecorator := TPoisonDecorator.Create(RetardDecorator);
    //制造攻击
    PoisonDecorator.MakeADAttack;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.

