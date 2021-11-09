unit UnitVisitorPattern;

interface

uses
  System.Generics.Collections;

type
  IVocation = interface;
	{抽象的材料}

  IMaterial = interface
    ['{B6C63803-01E0-4121-9BEC-B865D04DEDFD}']
    {来接受访问者}
    function Accept(Vocation: IVocation): string;
  end;

  {桑葚}
  TMulberry = class(TInterfacedObject, IMaterial)
  public
    function Accept(Vocation: IVocation): string; overload;
  end;

  {牛骨}
  TOxbone = class(TInterfacedObject, IMaterial)
  public
    function Accept(Vocation: IVocation): string; overload;
  end;

  {抽象的抽象访问者，职业}
  IVocation = interface
    ['{49803485-37AD-4689-9203-C97E9CB01300}']
    function Make(Mulberry: TMulberry): string; overload;
    function Make(Oxbone: TOxbone): string; overload;
  end;

  {制符}
  TSymbol = class(TInterfacedObject, IVocation)
  public
    function Make(Mulberry: TMulberry): string; overload;
    function Make(Oxbone: TOxbone): string; overload;
  end;

  {制药}
  TPharmacy = class(TInterfacedObject, IVocation)
    function Make(Oxbone: TOxbone): string; overload;
    function Make(Mulberry: TMulberry): string; overload;
  end;
  {原料集}
  TSetMaterial = class
  private
    FList: TList<IMaterial>;
  public
    property MaterialList: TList<IMaterial> read FList write Flist;
    function Accept(Vocation: IVocation): string;
    procedure Add(Material: IMaterial);
    procedure Remove(Material: IMaterial);
    constructor Create(); overload;
  end;

implementation

{ TMulberry }

function TMulberry.Accept(Vocation: IVocation): string;
begin
  Result := Vocation.make(Self);
end;

{ TOxbone }

function TOxbone.Accept(Vocation: IVocation): string;
begin
  Result := Vocation.make(Self);
end;

{ TSymbol }

function TSymbol.Make(Oxbone: TOxbone): string;
begin
  Result := '牛骨强身符';
end;

function TSymbol.Make(Mulberry: TMulberry): string;
begin
  Result := '紫色墨水';
end;

{ TPharmacy }

function TPharmacy.Make(Oxbone: TOxbone): string;
begin
  Result := '黑玉断续膏';
end;

function TPharmacy.Make(Mulberry: TMulberry): string;
begin
  Result := '天龙水';
end;



{ TSetMaterial }

function TSetMaterial.Accept(Vocation: IVocation): string;
begin
  var builder := '';
  for var Material in MaterialList do begin
    if Material is TMulberry then begin

      builder := builder + Vocation.Make(Material as TMulberry);
    end
    else if Material is TOxbone then begin
      Vocation.Make(Material as TOxbone);
      builder := builder + ',' + Vocation.Make(Material as TOxbone);
    end;

  end;

  Result := builder;
end;

procedure TSetMaterial.Add(Material: IMaterial);
begin
  MaterialList.Add(Material);
end;

constructor TSetMaterial.Create();
begin
  inherited;
  FList := TList<IMaterial>.Create();
end;

procedure TSetMaterial.Remove(Material: IMaterial);
begin

  MaterialList.Remove(Material);
end;

end.

