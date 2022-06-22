unit UnitFacade;

interface

type
  //好友
  TFriend = class
  public
    function IsFriend(a: string; b: string): Boolean;
  end;

  //结婚
  TMarry = class
  public
    procedure MarrySomeBody(a: string; b: string);
  end;

  //结拜
  TSworn = class
  public
    function IsSworn(a: string; b: string): Boolean;
  end;

  TSociety = class
  private
    FFriend: TFriend;
    FSworn: TSworn;
    FMarry: TMarry;
  public
    procedure Marry(a, b: string);

    constructor Create(); overload;
  end;

implementation

{ TFriend }

function TFriend.IsFriend(a, b: string): Boolean;
begin

  Result := True;
end;

{ TSworn }

function TSworn.IsSworn(a, b: string): Boolean;
begin

  Result := False;
end;

{ TMarry }

procedure TMarry.MarrySomeBody(a, b: string);
begin
  Writeln(a + '和' + b + ' 结婚了')
end;

{ TSociety }

constructor TSociety.Create;
begin
  //原文中还使用了单例模式，这里我直接创建对象了
  Self.FFriend := TFriend.Create;

  Self.FSworn := TSworn.Create;
  Self.FMarry := TMarry.Create;
end;

procedure TSociety.Marry(a, b: string);
begin
  if not Self.FFriend.IsFriend(a, b) then begin
    Writeln(a + '和' + b + ' 不是好友关系');
    Exit;
  end;

  if Self.FSworn.IsSworn(a, b) then begin
    Writeln(a + '和' + b + ' 是结拜关系');
    Exit;
  end;
  Writeln(a + ' 和 ' + b + '  是好友关系，不是结拜关系');
  FMarry.MarrySomeBody(a, b);
end;

end.

