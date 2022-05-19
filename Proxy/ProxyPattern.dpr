program ProxyPattern;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  ProxyUnit in 'ProxyUnit.pas';

begin
  try
      //�������߼�����������
    var Prop := TProp.Create;
    Prop.Blood := 100;
    Prop.PropName := 'Ģ��';

    //����Ӣ����,�����������
    var Hero := THero.Create(Prop);
    //����Ӧ���ǳ����ģ����Ը��ѭ��
    Hero.HeroName := '��Ī';

    while true do
    begin
      Hero.makeAttack();
      //ÿ����һ�ε��ߵ�����ֵ����һ��
      Hero.Prop.Blood := Hero.Prop.Blood - 50;

      if Hero.Prop.Blood < 50 then
        break;
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  readln;

end.
