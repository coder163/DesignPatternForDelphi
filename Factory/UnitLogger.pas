unit UnitLogger;

interface

uses
    System.SysUtils;

type
    { 日志接口 }
    ILogger = interface(IUnKnown)
        ['{2C7DD96A-795F-4D8A-99C7-EC7D4CD9F475}']
        procedure Log();
    end;

    { 硬盘的实现方式 }
    TDiskLogger = class(TInterfacedObject, ILogger)
    public
        procedure Log(); overload;
    end;

    { 控件的实现方式 }
    TComponentLogger = class(TInterfacedObject, ILogger)
        procedure Log(); overload;
    end;

    { 定义工厂类 }
    TLoggerFactory = class(TObject)
    public
        class function GetLogger(LoggerType: Integer): ILogger;
    end;

implementation

{ TDiskLogger }

procedure TDiskLogger.Log;
begin
    Writeln('将日志写入硬盘');
end;

{ TComponentLogger }

procedure TComponentLogger.Log;
begin
    Writeln('将日志在控件上进行展示');
end;

{ TLoggerFactory }
class function TLoggerFactory.GetLogger(LoggerType: Integer): ILogger;
begin
    case LoggerType of
        1: begin
                Result := TDiskLogger.Create();
            end;
        2: begin
                Result := TDiskLogger.Create();
            end;
    else raise Exception.Create('类型非法');
    end;
end;

end.
