program MediatorPattern;

{$APPTYPE CONSOLE}
{$R *.res}

{ 中介者模式 }
uses
    System.SysUtils;

type

    // 抽象房东及房子信息
    TColleague = class abstract
    public
        // 基本的信息展示
        procedure Handle(); virtual; abstract;
    end;

    // 定义具体的房屋类型，小房间
    TSmallHouseColleague = class(TColleague)

    public
        procedure Handle(); override;
    end;

    // 两居室
    TTwoHouseColleague = class(TColleague)
    public
        procedure Handle(); override;
    end;

    // 抽象中介者,可以是任意类型的中介
    TMediator = class abstract

    public
        { 定义沟通方式 }
        procedure Common(HouseType: Integer); virtual; abstract;
    end;

    // 定义中介者的具体实现
    THouseMediator = class(TMediator)
        // 中介中登记的房屋信息
    private
        FSmallHouseColleague: TSmallHouseColleague;
        FTwoHouseColleague: TTwoHouseColleague;
    public
        property SmallHouseColleague: TSmallHouseColleague read FSmallHouseColleague write FSmallHouseColleague;
        property TwoHouseColleague: TTwoHouseColleague read FTwoHouseColleague write FTwoHouseColleague;

        // 重写父类方法
        procedure Common(HouseType: Integer); override;
    end;

    { TSmallHouseColleague }

procedure TSmallHouseColleague.Handle;
begin
    Writeln('小房间展示');
end;

{ TTwoHouseColleague }

procedure TTwoHouseColleague.Handle;
begin
    Writeln('两居室房间展示');
end;

{ THouseMediator }

procedure THouseMediator.Common(HouseType: Integer);
begin
    case HouseType of
        1: begin
                SmallHouseColleague.Handle;
            end;
        2: begin
                TwoHouseColleague.Handle;
            end;
    else Writeln('没有符合需求的房屋');
    end;
end;

begin
    try
        // 创建中介对象
        var
        HouseMediator := THouseMediator.Create;
        // 登记房屋信息
        HouseMediator.SmallHouseColleague := TSmallHouseColleague.Create;
        HouseMediator.TwoHouseColleague := TTwoHouseColleague.Create;
        // 小黑要租房
        HouseMediator.Common(1);
        readln;
    except
        on E: Exception do Writeln(E.ClassName, ': ', E.Message);
    end;

end.
