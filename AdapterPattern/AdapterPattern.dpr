program AdapterPattern;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  AdapterBasicWithClassUnit in 'AdapterBasicWithClassUnit.pas',
  AdapterBasicWithObjectUnit in 'AdapterBasicWithObjectUnit.pas',
  MediaAdapterUnit in 'MediaAdapterUnit.pas';

procedure TestAdapterClass();
   //相当于客户端
begin

  //获取适配器，相当于要给手机充电要先拿到充电器
  var Target := TAdapter.Create;
  //发起请求
  Target.Request();
end;

procedure TestAdapterObject();
begin
    //获取适配器，相当于要给手机充电要先拿到充电器
  var Target := AdapterBasicWithObjectUnit.TAdapter.Create;
  //发起请求
  Target.Request();
end;

procedure MediaAdapter();
begin
  var AudioPlayer := TAudioPlayer.Create();
  AudioPlayer.play('MP3', '挪威的森林.mp3');
  AudioPlayer.play('MP4', '挪威的森林.mp4');
  AudioPlayer.play('vlc', '挪威的森林.vlc');
  AudioPlayer.play('avi', '水手.avi');

end;

begin
  try
   // TestAdapterObject();
    MediaAdapter();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.

