program VisitorPattern;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UnitVisitorPattern in 'UnitVisitorPattern.pas';

begin
  try

    //桑葚
    var Mulberry := TMulberry.Create();
    //牛骨
    var Oxbone := TOxbone.Create();
    //原料集
    var SetMaterial := TSetMaterial.Create();
    SetMaterial.Add(Mulberry);
    SetMaterial.Add(Oxbone);
    //访问者-制符
    Writeln('制符业：' + SetMaterial.Accept(TSymbol.Create()));
     //访问者-制药
    Writeln('制药业：' + SetMaterial.Accept(TPharmacy.Create()));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.

