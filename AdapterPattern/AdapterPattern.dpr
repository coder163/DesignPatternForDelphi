program AdapterPattern;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  AdapterBasicWithClassUnit in 'AdapterBasicWithClassUnit.pas';

procedure TestAdapterClass();
   //�൱�ڿͻ���
begin

  //��ȡ���������൱��Ҫ���ֻ����Ҫ���õ������
  var Target := TAdapter.Create;
  //��������
  Target.Request();
end;

begin
  try
    TestAdapterClass();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
