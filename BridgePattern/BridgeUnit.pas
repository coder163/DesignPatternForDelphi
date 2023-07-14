unit BridgeUnit;

interface

type
  ISkill = interface
    // 技能接口
    ['{70A22670-D265-4CE2-9367-881BBA434D3A}']
    // 技能功效,可以作为技能的具体实现方式
    procedure skillEffect(HeroName: string);
  end;

  TFastRun = class(TInterfacedObject, ISkill)
    // 疾跑
  public
    procedure skillEffect(HeroName: string); overload;
  end;

  TLgnition = class(TInterfacedObject, ISkill)
    // 引燃
  public
    procedure skillEffect(HeroName: string); overload;
  end;

type
  // 技能列表
  TSkill = array [0 .. 1] of ISkill;
  // 技能选项

  TSkillEnum = (Lgnition, FastRun);

  THero = class abstract

    // 英雄类
  private
    FSkillList: TSkill;
  public
    property SkillList: TSkill read FSkillList write FSkillList;
    procedure UseSkill(SkillEnum: TSkillEnum); virtual; abstract;
  end;

  TGoldenHero = class(THero)
    // 金克丝
  public
    procedure UseSkill(SkillEnum: TSkillEnum); override;
  end;

  TSindlaHero = class(THero)
    // 辛德拉
  public
    procedure UseSkill(SkillEnum: TSkillEnum); override;
  end;

implementation

{ TFastRun }

procedure TFastRun.skillEffect(HeroName: string);
begin
  Writeln('召唤师【' + HeroName + '】开启疾跑，移速增加300%');
end;

{ TLgnition }

procedure TLgnition.skillEffect(HeroName: string);
begin
  Writeln('召唤师【' + HeroName + '】开启引燃，对目标增加10%的持续伤害，持续时间6秒');
end;

{ TGoldenHero }

procedure TGoldenHero.UseSkill(SkillEnum: TSkillEnum);
begin

  case SkillEnum of
    Lgnition:
      begin
        SkillList[0].skillEffect('金克丝');
      end;
    FastRun:
      begin
        SkillList[1].skillEffect('金克丝');
      end;

  end;

end;

{ TSindlaHero }

procedure TSindlaHero.UseSkill(SkillEnum: TSkillEnum);
begin
  case SkillEnum of
    Lgnition:
      begin
        SkillList[0].skillEffect('辛德拉');
      end;
    FastRun:
      begin
        SkillList[1].skillEffect('辛德拉');
      end;

  end;
end;

end.
