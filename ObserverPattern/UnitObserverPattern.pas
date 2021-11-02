unit UnitObserverPattern;

interface

uses
  System.Generics.Collections;

type
  //观察者，需要有一个更新自身（观察者）状态的方法
  IObserver = interface
    ['{6B71C6A8-01FD-43E0-B4F8-EDCFBFFA911D}']
    procedure Update();
  end;

  //怪物：具体的观察者
  TMonster = class(TInterfacedObject, IObserver)
  public
    procedure Update(); overload;
     //判断角色是否在自己的影响范围内，这里忽略细节，直接返回true
    function IsInRange(): Boolean;
  end;

  TTrap = class(TInterfacedObject, IObserver)
     //陷阱：具体的观察者
  public
    procedure Update(); overload;
       //判断角色是否在自己的影响范围内，这里忽略细节，直接返回true
    function IsInRange(): Boolean;
  end;

  TSubject = class abstract
  //被观察者，定义对于观察者的操作
  private
    FObserverList: TLIst<IObserver>;
    constructor Create(); overload;
  public
    property ObserverList: TLIst<IObserver> read FObserverList write FObserverList;
    //添加观察者
    procedure AddObserver(Observer: IObserver);
    //删除观察者
    procedure DeleteObserver(Observer: IObserver);
    //通知所有的观察者
    procedure NotifyObservers();
  end;

  //角色：具体的被观察者
  TRole = class(TSubject)
  public
  //角色移动
    procedure Move();
    constructor Create(); overload;
  end;

implementation

{ TSubject }

procedure TSubject.AddObserver(Observer: IObserver);
begin
  Self.ObserverList.Add(Observer);
end;

constructor TSubject.Create;
begin
  inherited;
  Self.FObserverList := TList<IObserver>.Create;
end;

procedure TSubject.DeleteObserver(Observer: IObserver);
begin
  Self.ObserverList.Delete(Self.ObserverList.IndexOf(Observer));
end;

procedure TSubject.NotifyObservers;
begin

  for var Observer in ObserverList do begin
    Observer.Update;
  end;
end;

{ TMonster }

function TMonster.IsInRange: Boolean;
begin
  Result := True;
end;

procedure TMonster.Update;
begin
  if (Self.IsInRange) then
    Writeln('进入怪物的攻击范围');
end;

{ TTrap }

function TTrap.IsInRange: Boolean;
begin
  Result := True;
end;

procedure TTrap.Update;
begin
  if (Self.IsInRange) then
    Writeln('进入陷阱的攻击范围');
end;

{ TRole }

constructor TRole.Create;
begin
  inherited Create;
end;

procedure TRole.Move;
begin
  Writeln('角色移动');
  self.NotifyObservers;
end;

end.

