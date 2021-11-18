unit MediaAdapterUnit;

interface

type
  IAdvancedMediaPlayer = interface
    {高级媒体播放器}
    ['{E2916008-25A7-4E34-8B80-0851A4A429C9}']
    procedure PlayVlc(FileName: string);
    procedure PlayMp4(FileName: string);
  end;

  TVlcPlayer = class(TInterfacedObject, IAdvancedMediaPlayer)
  {高级播放器的具体实现}
  public
    procedure PlayVlc(FileName: string); overload;
    procedure PlayMp4(FileName: string); overload;
  end;

  TMp4Player = class(TInterfacedObject, IAdvancedMediaPlayer)
   {高级播放器的具体实现}
  public
    procedure PlayVlc(FileName: string); overload;
    procedure PlayMp4(FileName: string); overload;
  end;

  IMediaPlayer = interface
    {媒体播放器,对外的播放接口}
    ['{6053CA47-F7AF-418D-8814-3DC6810303E0}']
    procedure Play(AudioType, FileName: string);
  end;

  TMediaAdapter = class(TInterfacedObject, IMediaPlayer)
  {MediaPlayer 接口的适配器类}
  private
    {通过对象的形式关联高级播放器}
    FAdvancedMediaPlayer: IAdvancedMediaPlayer;
  public
    procedure Play(AudioType, FileName: string); overload;
    constructor Create(AudioType: string); overload;
  end;

  TAudioPlayer = class(TInterfacedObject, IMediaPlayer)
      {音频播放器,默认只能播放MP3}
  private
    {关联适配器之后，具备高级播放器的功能}
    FMediaAdapter: TMediaAdapter;
  public
    procedure Play(AudioType, FileName: string); overload;
  end;

implementation

{ TAudioPlayer }

procedure TAudioPlayer.Play(AudioType, FileName: string);
begin

  if 'MP3' = AudioType then
    Writeln('默认支持的类型:MP3')
  else if ('MP4' = AudioType) or ('vlc' = AudioType) then begin

    FMediaAdapter := TMediaAdapter.Create(AudioType);
    FMediaAdapter.Play(AudioType, FileName);
  end
  else
    Writeln('该类型暂不支持')

end;

{ TMediaAdapter }

constructor TMediaAdapter.Create(AudioType: string);
begin
  if (AudioType = 'MP4') then
    FAdvancedMediaPlayer := TMp4Player.Create()
  else if (AudioType = 'vlc') then
    FAdvancedMediaPlayer := TVlcPlayer.Create()

end;

procedure TMediaAdapter.Play(AudioType, FileName: string);
begin

  if ('MP4' = AudioType) then
    FAdvancedMediaPlayer.PlayMp4(FileName)
  else if ('vlc' = AudioType) then
    FAdvancedMediaPlayer.PlayVlc(FileName)

end;

{ TVlcPlayer }

procedure TVlcPlayer.PlayMp4(FileName: string);
begin
//不支持此格式可用空实现
  Writeln('不支持此格式可用空实现' + FileName);

end;

procedure TVlcPlayer.PlayVlc(FileName: string);
begin
  Writeln('Vlc.PlayVlc播放器播放：' + FileName + #13);
end;

{ TMp4Player }

procedure TMp4Player.PlayMp4(FileName: string);
begin
  Writeln('TMp4Player.PlayVlc播放器播放：' + FileName + #13);
end;

procedure TMp4Player.PlayVlc(FileName: string);
begin
    //不支持此格式可用空实现
  Writeln('不支持此格式可用空实现：' + FileName);
end;

end.

