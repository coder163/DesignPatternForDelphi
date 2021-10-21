program Prototype;

{$APPTYPE CONSOLE}

{$R *.res}

uses
    System.SysUtils,
    UnitPrototype in 'UnitPrototype.pas';

begin
    var Citation := TCitation.Create();
    Citation.Name := '小黑';
    //Writeln(Integer(@Citation).ToHexString);

    Writeln(Citation.Name+'同学：在2020学年第一学期中表现优秀，被评为三好学生。特发此状！');

    //克隆一个对象
    var Citation1 := Citation.Clone();

    //在没有重新赋值之前，克隆出来的对象保持原来的值
    Writeln(Citation.Name);

    Readln;
end.

