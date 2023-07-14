program Combination;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UnitCombination in 'UnitCombination.pas';

begin
  try
    var Component := TCompany.Create('软件开发公司');
    var Department := TCompany.Create('财务部');

    department.Add(TWorkers.Create('A组'));
    department.Add(TWorkers.Create('B组'));
    component.Add(department);

    var Department01 := TCompany.Create('研发部');
    Department01.Add(TWorkers.Create('A组'));
    Department01.Add(TWorkers.Create('B组'));

    component.Add(Department01);

    Component.Print;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  readln;
end.

