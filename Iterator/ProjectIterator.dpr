program ProjectIterator;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils,
    uIterator in 'uIterator.pas';

begin
    try
        // 创建容器类对象
        var
        Repository := TNameRepository.Create();
        // 获取迭代器对象
        var
        Iterator := Repository.GetIterator();

        // 通过迭代器获取元素
        while Iterator.hasNext do writeln(Iterator.Next);

    except
        on E: Exception do writeln(E.ClassName, ': ', E.Message);
    end;

    Readln;

end.
