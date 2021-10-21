unit UnitState;

interface

type
    // 抽象状态类：用以封装环境对象中的特定状态所对应的行为，可以有一个或多个行为
    TWeatherState = class
    public
         //获取天气状态的信息
        function GetWeatherMessage(): string; virtual; abstract;
    end;


    // 实现抽象状态所对应的行为，并且在需要的情况下进行状态切换。
    //具体状态类下雨
    TRain = class(TWeatherState)
    public
        function GetWeatherMessage(): string; override;
    end;

     //具体状态类晴天
    TSunshine = class(TWeatherState)
    public
        function GetWeatherMessage(): string; override;
    end;

    TContext = class
    //环境类:定义了客户端需要的接口，内部维护一个当前状态，并负责具体状态的切换。
    private
        FWeather: TWeatherState;
    public
        //切换状态
        property CurrentWeather: TWeatherState read FWeather write FWeather;

        //获取天气信息
        function GetWeather(): string;
        //重写构造
        constructor Create(); overload;
    end;

implementation

{ TRain }

function TRain.GetWeatherMessage: string;
begin
    Result := '有雨';
end;

{ TSunshine }

function TSunshine.GetWeatherMessage: string;
begin

    Result := '晴天';
end;

{ TContext }

constructor TContext.Create;
begin
    //默认维护的状态
    Self.CurrentWeather := TRain.Create();
end;

function TContext.GetWeather: string;
begin
    Result := CurrentWeather.GetWeatherMessage();

end;

end.

