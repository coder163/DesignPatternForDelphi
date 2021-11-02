program ObserverPattern;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UnitObserverPattern in 'UnitObserverPattern.pas';

begin
  try

    //创建被观察者,即游戏角色
    var Role := TRole.Create();
    //添加观察者
    Role.AddObserver(TMonster.Create);
    //角色移动
    Role.Move;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.

