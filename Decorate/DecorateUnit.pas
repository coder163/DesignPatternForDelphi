unit DecorateUnit;

interface

type
  // 攻击接口
  INormalAttack = interface
    ['{D8FE89F6-8492-48E4-85BF-72C2940C2259}']
    procedure MakeADAttack();
  end;

  // 普通攻击
  TNormalAttack = class(TInterfacedObject, INormalAttack)
  private
    FAdAttack: Integer;

  public
    property AdAttack: Integer read FAdAttack write FAdAttack;
    procedure MakeADAttack(); overload;

    //构造方法，用于初始化攻击值
    constructor Create(AdAttack: Integer); overload;
  end;

  //基础装饰器
  TNormalAttackDecorator = class abstract(TInterfacedObject, INormalAttack)
  private
    FNormalAttack: INormalAttack;
  private
    FSpecialEfficacy: string;
  public
    property NormalAttack: INormalAttack read FNormalAttack write FNormalAttack;
    //虚函数，不做函数实现
    procedure MakeADAttack(); virtual; abstract;

    constructor Create(NormalAttack: INormalAttack); overload;
  end;

  //减速
  TRetardDecorator = class(TNormalAttackDecorator)
  public
    procedure MakeADAttack(); override;

    constructor Create(NormalAttack: INormalAttack); overload;
  end;
  //中毒

  TPoisonDecorator = class(TNormalAttackDecorator)
  public
    procedure MakeADAttack(); override;

    constructor Create(NormalAttack: INormalAttack); overload;
  end;

implementation

{ TNormalAttack }
uses
  System.SysUtils;

constructor TNormalAttack.Create(AdAttack: Integer);
begin

  Self.AdAttack := AdAttack;
end;

procedure TNormalAttack.MakeADAttack;
begin
  Writeln('初始攻击值为：' + Self.AdAttack.ToString);
end;

{ TNormalAttackDecorator }

constructor TNormalAttackDecorator.Create(NormalAttack: INormalAttack);
begin

  Self.NormalAttack := NormalAttack;

end;

{ TRetardDecorator }

constructor TRetardDecorator.Create(NormalAttack: INormalAttack);
begin
  inherited Create(NormalAttack);
  self.FSpecialEfficacy := '减速';
end;

procedure TRetardDecorator.MakeADAttack;
begin
  Self.NormalAttack.MakeADAttack();
  Writeln('增加了' + self.FSpecialEfficacy + 'Buff');

end;

{ TPoisonDecorator }

constructor TPoisonDecorator.Create(NormalAttack: INormalAttack);
begin
  inherited Create(NormalAttack);
  self.FSpecialEfficacy := '中毒';
end;

procedure TPoisonDecorator.MakeADAttack;
begin

  Self.NormalAttack.MakeADAttack();

  Writeln('增加了' + self.FSpecialEfficacy + 'Buff');
end;

end.

