unit uCommonUtil;

interface

uses
    System.SysUtils;

type
   { TSingle }
    TSingle = class(TObject)
    private
        FNum: string;
    protected
    public
        constructor Create;
        class function GetInstance(): TSingle;
        class function NewInstance: TObject; override;
        procedure FreeInstance; override;
        property Str: string read FNum write FNum;
    published
    end;

implementation

var
    GlobalSingle: TSingle;
   { TSingle }

constructor TSingle.Create;
begin
    Str := '单例模式测试';
end;

procedure TSingle.FreeInstance;
begin
    inherited;
    GlobalSingle := nil;
end;

class function TSingle.GetInstance: TSingle;
begin
    //判断当前全局变量GlobalSingle不空则创建对象,这里在并发环境下存在安全隐患
    if GlobalSingle = nil then begin
        GlobalSingle := TSingle.create();
    end;
    Result := GlobalSingle;
end;

class function TSingle.NewInstance: TObject;
begin
    if GlobalSingle = nil then
        //重载方法通过父类  NewInstance方法获取对象，强制转换为 TSingle类型
        GlobalSingle := TSingle(inherited NewInstance);
    Result := GlobalSingle;
end;

end.

