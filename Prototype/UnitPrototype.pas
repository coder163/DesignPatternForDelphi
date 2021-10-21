unit UnitPrototype;

interface

uses
    System.Classes;

type
    TPrototype = class(TPersistent)
    protected
        //自己实现克隆的函数
        function Clone: TPrototype; virtual; abstract;
    end;

    TCitation = class(TPrototype)
    private
        FName: string;
    public

        property Name: string read FName write FName;

        //重写父类的方法
        procedure Assign(Source: TPersistent); override;

        function Clone: TPrototype; override;
    end;

implementation

{ TConcreatePrototype1 }

procedure TCitation.Assign(Source: TPersistent);
begin
    //类型转换并完成属性赋值
    if Source is TCitation then begin

        with Source as TCitation do begin

            self.Name := Name;

        end;

    end
    else begin
        inherited;
    end;

end;



function TCitation.Clone: TPrototype;
begin

    //此处的 Result 所代表的为 目标(target)
    Result := TCitation.Create;

    //将 源 复制到 目标并返回
    Result.Assign(self);
end;

end.

