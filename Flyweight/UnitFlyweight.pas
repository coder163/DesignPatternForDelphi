unit UnitFlyweight;

interface

uses
  System.Generics.Collections;

type
    //定义一个枚举类型
  TColor = (BLACK, WHITE);

type
    //定义一个共享对象通用的接口
  IChess = interface
    //绘制棋子
    procedure Draw(x, y: Integer);
  end;

type
    //黑棋类
  TBlackChess = class(TInterfacedObject, IChess)
  private
   //内部状态，共享
    FColor: TColor;
    const
      SHARP: string = '圆形';
  public
    //重写接口中的函数
    procedure Draw(x, y: Integer); overload;
    //重写构造
    constructor Create(); overload;
  end;

type
    //白棋类
  TWhiteChess = class(TInterfacedObject, IChess)
  private
   //内部状态，共享
    FColor: TColor;
    const
      SHARP: string = '圆形';
  public
    //重写接口中的函数
    procedure Draw(x, y: Integer); overload;
    //重写构造
    constructor Create(); overload;
  end;

type
    //共享对象工厂
  TChessFactory = class
  private
    FDictionary: TDictionary<TColor, IChess>;
  public
    constructor Create(); overload;

    function GetChess(Color: TColor): IChess;

  end;

implementation

uses
  System.SysUtils, System.TypInfo;
{ TBlackChess }

constructor TBlackChess.Create();
begin
  inherited;
  //颜色赋值
  FColor := TColor.BLACK;
end;

procedure TBlackChess.Draw(x, y: Integer);
begin
  var EnumName := GetEnumName(TypeInfo(TColor), 0);

  Writeln(SHARP + EnumName + '棋子置于（' + inttostr(x) + '，' + inttostr(y) + '）处')
end;

{ TWhiteChess }

constructor TWhiteChess.Create;
begin
  inherited;
  //颜色赋值
  FColor := TColor.WHITE;
end;

procedure TWhiteChess.Draw(x, y: Integer);
begin

  var EnumName := GetEnumName(TypeInfo(TColor), 1);

  Writeln(SHARP + EnumName + '棋子置于（' + inttostr(x) + '，' + inttostr(y) + '）处')

end;

{ TChessFactory }

constructor TChessFactory.Create;
begin
  FDictionary := TDictionary<TColor, IChess>.Create;
end;

function TChessFactory.GetChess(Color: TColor): IChess;
begin
  var Chess: IChess;
  FDictionary.TryGetValue(Color, Chess);
//  writeln(Integer(Chess));
  if Chess = nil then
  begin
    if Color = TColor.WHITE then
      Chess := TWhiteChess.Create
    else
      Chess := TBlackChess.Create;

    FDictionary.Add(Color, Chess);

  end;
  Result := Chess;
end;

end.

