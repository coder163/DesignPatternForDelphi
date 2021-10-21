program Memento;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils;

type
    // 类型前置声明
    TRole = class;

    // 备忘录类
    TRoleMemento = class
    private
        // 生命力
        FVitality: Integer;
        // 攻击力
        FAggressivity: Integer;
        // 防御力
        FDefensivePower: Integer;

    public
        property Vitality: Integer read FVitality write FVitality;

        property Aggressivity: Integer read FAggressivity write FAggressivity;

        property DefensivePower: Integer read FDefensivePower write FDefensivePower;
        // 重写构造
        constructor Create(Role: TRole); overload;
    end;

    // 备忘录管理者类
    TRoleStateCaretaker = class
    private
        // 这里为了降低学习成本仅仅保存了备忘录中的一个节点，如果需要可以使用容器对象
        FRoleMemento: TRoleMemento;

    public
        property RoleMemento: TRoleMemento read FRoleMemento write FRoleMemento;
    end;

    // 游戏的角色类即源发器类
    TRole = class
    private
        // 生命力
        FVitality: Integer;
        // 攻击力
        FAggressivity: Integer;
        // 防御力
        FDefensivePower: Integer;

    public
        property Vitality: Integer read FVitality write FVitality;

        property Aggressivity: Integer read FAggressivity write FAggressivity;

        property DefensivePower: Integer read FDefensivePower write FDefensivePower;

        // 存档

        function RoleMemento(): TRoleMemento;

        // 恢复
        procedure RoleRecovery(RoleMemento: TRoleMemento);
    end;

    { TRole }

function TRole.RoleMemento: TRoleMemento;
begin
    Result := TRoleMemento.Create(Self);
end;

procedure TRole.RoleRecovery(RoleMemento: TRoleMemento);
begin
    Self.Vitality := RoleMemento.Vitality;
    Self.Aggressivity := RoleMemento.Aggressivity;
    Self.DefensivePower := RoleMemento.DefensivePower;
end;

{ TRoleMemento }

constructor TRoleMemento.Create(Role: TRole);
begin
    Self.Vitality := Role.Vitality;
    Self.Aggressivity := Role.Aggressivity;
    Self.DefensivePower := Role.DefensivePower;
end;

// 测试代码
begin
    try
        var
        Role := TRole.Create;
        // 初始化角色的状态信息
        Role.Vitality := 10;
        Role.Aggressivity := 2;
        Role.DefensivePower := 4;
        Writeln('角色初始状态：生命力：', Role.Vitality, ',攻击力：', Role.Aggressivity, ',防御力：', Role.DefensivePower);
        // 存档
        var
        RoleStateCaretaker := TRoleStateCaretaker.Create();
        RoleStateCaretaker.RoleMemento := Role.RoleMemento;

        // 变更角色状态信息
        Role.Vitality := 5;
        Role.Aggressivity := 1;
        Role.DefensivePower := 2;
        Writeln('角色打怪之后状态：生命力：', Role.Vitality, ',攻击力：', Role.Aggressivity, ',防御力：', Role.DefensivePower);

        // 打坐或者嗑药之后恢复状态
        Role.RoleRecovery(RoleStateCaretaker.RoleMemento);
        Writeln('角色恢复之后状态：生命力：', Role.Vitality, ',攻击力：', Role.Aggressivity, ',防御力：', Role.DefensivePower);

        Readln;
    except
        on E: Exception do Writeln(E.ClassName, ': ', E.Message);
    end;

end.
