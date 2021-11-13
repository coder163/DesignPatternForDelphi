unit AdapterBasicWithClassUnit;

{适配器模式-类}

interface

type
  ITarget = interface(IInterface)
    ['{6B9A4DB9-7DCB-4C6F-B1AD-D46E3194D5D3}']
    {目标}
    procedure Request;
  end;

  TAdaptee = class(TInterfacedObject)
  {被适配类}
  public
    procedure SpecificRequest;
  end;

  TAdapter = class(TAdaptee, ITarget)
  {适配器}
  public
    procedure Request;
  end;

implementation

{ TAdapter }

procedure TAdapter.Request;
begin

  Writeln('适配成功，调用适配器的方法');
  SpecificRequest;
end;

{ TAdaptee }

procedure TAdaptee.SpecificRequest;
begin

  Writeln('被适配类的源方法的代码');
end;

end.

