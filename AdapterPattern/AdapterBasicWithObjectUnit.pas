unit AdapterBasicWithObjectUnit;

interface

type
  TTarget = class abstract
  {目标，最终的目的，类似于播放功能}
  public
    procedure Request; virtual; abstract;
  end;

  TAdaptee = class(TObject)
  {被适配类，具体的实现，类似于可以播放特定类型视频的插件}
  public
    procedure SpecificRequest;
  end;

  TAdapter = class(TTarget)

   {适配器类，将目标和被适配类关联起来}

  private
	//和类的适配器写法不同的就是这里了
    FAdaptee: TAdaptee;
  public
    constructor Create;
    procedure Request; override;
  end;

implementation

{ TAdaptee }

procedure TAdaptee.SpecificRequest;
begin
  Writeln('我可以处理特殊的请求');
end;

{ TAdapter }

constructor TAdapter.Create;
begin
    //关联
  FAdaptee := TAdaptee.Create;
end;

procedure TAdapter.Request;
begin
  //TODO 可以编写具体的功能代码
  Writeln('适配成功，调用适配器的方法');
  FAdaptee.SpecificRequest;
end;

end.

