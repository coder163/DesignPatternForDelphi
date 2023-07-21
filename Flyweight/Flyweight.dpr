program Flyweight;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.TypInfo,
  UnitFlyweight in 'UnitFlyweight.pas';

var
  r1: IChess;

begin
  try

    var ChessFactory := TChessFactory.Create();
    //下黑子
    var BackChess1 := ChessFactory.GetChess(Tcolor.BLACK);
    BackChess1.Draw(1, 2);
     //下白子
    var WhiteChess1 := ChessFactory.GetChess(Tcolor.WHITE);
    WhiteChess1.Draw(2, 2);
    //下黑子
    var BackChess2 := ChessFactory.GetChess(Tcolor.BLACK);
    BackChess2.Draw(1, 3);
    var BackChess3 := ChessFactory.GetChess(Tcolor.BLACK);
    BackChess3.Draw(1, 3);
    //打印一下内存地址
    writeln(Integer(WhiteChess1),'，',Integer(BackChess1), '，', Integer(BackChess2), '，', Integer(BackChess3));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.

