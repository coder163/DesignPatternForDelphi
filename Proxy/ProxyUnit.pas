unit ProxyUnit;

interface

type
  INormalAttack = interface
    ['{0D26D561-70A3-4D36-85D0-2E3FF6F1E8EB}']
    // ���칥��
    procedure makeAttack();
  end;

  // ����(�����ǳ����������̨��) ,��Ȼ�����ٽ��������������������ʽ��Ϊ�˱�����븴������Ͳ�����չ

  TProp = class(TInterfacedObject, INormalAttack)
  private
    // ����ֵ
    FBlood: Integer;
    FName: string;
  public
    property Blood: Integer read FBlood write FBlood;
    property PropName: string read FName write FName;

    // ����
    procedure makeAttack(); overload;
  end;

  // Ӣ��(�����ǰ��ݡ���Ī�ȵ�)
  THero = class(TInterfacedObject, INormalAttack)
  private
    FProp: TProp;
     //�����name����û�취�ƺ�
    FName: string;
  public
    property HeroName: string read FName write FName;

    property Prop: TProp read FProp write FProp;
   
    // ���췽��������Ϊ����
    constructor Create(Prop: TProp); overload;
    // �Ხ˹����
    procedure makeAttack(); overload;
  end;

implementation

{ TTibbers }

procedure TProp.makeAttack;
begin

  Writeln(Self.PropName + '��Ŀ������˺�');
end;

{ Annie }

constructor THero.Create(Prop: TProp);
begin

  FProp := Prop;
end;

procedure THero.makeAttack;
begin

  if FProp.Blood > 50 then
  begin
    Writeln(self.HeroName + '��' + FProp.PropName + '�ڽ��й���');
    FProp.makeAttack();
  end
  else
  begin
    Writeln(FProp.PropName + '����ֵ̫�ͣ�ֹͣ����');
  end;

end;

end.
