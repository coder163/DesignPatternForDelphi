unit UnitCombination;

interface

uses
  System.Generics.Collections;

type
  //组织构成 => 对应Component角色
  IOrganizationComponent = class abstract
    procedure Print(); virtual; abstract;
    procedure Add(OrganizationComponent: IOrganizationComponent); virtual; abstract;
    procedure Remove(OrganizationComponent: IOrganizationComponent); virtual; abstract;

  end;

  //公司 => 对应Composite角色
  TCompany = class(IOrganizationComponent)
  private
    FList: TList<IOrganizationComponent>;
    FName: string;

  public
    procedure Add(OrganizationComponent: IOrganizationComponent); overload;
    procedure Remove(OrganizationComponent: IOrganizationComponent); overload;
    procedure Print(); override;
    //带参构造
    constructor Create(Name: string); overload;
  end;

  //员工 => 对应的是Leaf角色

  TWorkers = class(IOrganizationComponent)
  private
    FName: string;
  public
   //带参构造
    constructor Create(Name: string); overload;
    procedure Print(); override;
  end;

implementation

{ TComposite }

uses
  System.SysUtils;

{ TCompany }



{ TCompany }

procedure TCompany.Add(OrganizationComponent: IOrganizationComponent);
begin
  Self.FList.Add(OrganizationComponent);
end;

constructor TCompany.Create(Name: string);
begin

//  inherited Create();
  self.FName := Name;
  Self.FList := TList<IOrganizationComponent>.create();

end;

procedure TCompany.Print;
begin
  Writeln('***********' + Self.FName);
  for var index := 0 to Self.FList.Count - 1 do
  begin
    var OrganizationComponent := Self.FList.Items[index];

    OrganizationComponent.print();
  end;
end;

procedure TCompany.Remove(OrganizationComponent: IOrganizationComponent);
begin
  Self.FList.Remove(OrganizationComponent);
end;





{ TDepartment }

//procedure TDepartment.Add(OrganizationComponent: IOrganizationComponent);
//begin
//  Self.FList.Add(OrganizationComponent);
//end;
//
//constructor TDepartment.Create(Name: string);
//begin
//  self.FName := Name;
//  Self.FList := TList<IOrganizationComponent>.create();
//end;
//
//procedure TDepartment.Print;
//begin
//  Writeln('------------' + Self.FName);
//  for var index := 0 to Self.FList.Count - 1 do
//  begin
//
//    var OrganizationComponent := Self.FList.Items[index];
//
//    OrganizationComponent.print();
//  end;
//end;

//procedure TDepartment.Remove(OrganizationComponent: IOrganizationComponent);
//begin
//  Self.FList.Remove(OrganizationComponent);
//end;

{ TWorkers }

constructor TWorkers.Create(Name: string);
begin
//  inherited Create(Name);
  Self.FName := Name
end;

procedure TWorkers.Print;
begin

  Writeln(Self.FName)
end;

initialization

end.

