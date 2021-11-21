program BridgePattern;

{$APPTYPE CONSOLE}

{$R *.res}

 {桥接模式}
uses
  System.SysUtils,
  BridgeUnit in 'BridgeUnit.pas';

var
  List: TSkill;

begin
  try

    //构造英雄
    var SindlaHero := TSindlaHero.Create();

    //创建技能列表，相当于装配技能
    List[0] := TFastRun.create();
    List[1] := TLgnition.Create();
    SindlaHero.SkillList := List;

    //辛德拉使用技能-引燃
    SindlaHero.UseSkill(Lgnition);

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  readln;
end.

