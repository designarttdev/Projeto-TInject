program TInject;

uses
  Vcl.Forms,
  Windows,
  System.IniFiles,
  uTInject.ConfigCEF,
  u_principal in 'u_principal.pas' {frmPrincipal},
  System.SysUtils ;


{$R *.res}

//var arqIni: TInifile;
var aIni: TInifile;

begin
  {##########################################################################################
  Colocar arquivos CEFLib junto a pasta binária da aplicação (Nao definir ou passar vazio)
  Caso deseja informar.. segue exemplo abaixo
  ##########################################################################################}

  {
  arqIni  := Tinifile.Create(ExtractFilePath(Application.ExeName)+ 'config.ini');

  GlobalCEFApp.PathLogFile          := '';
  GlobalCEFApp.PathFrameworkDirPath := arqIni.ReadString('CONFIG', 'FRAMEWORK', '');  //'C:\TInject\Projeto-TInject-master\Demo\BIN';
  GlobalCEFApp.PathResourcesDirPath := arqIni.ReadString('CONFIG', 'RESOURCES', ''); //'C:\TInject\Projeto-TInject-master\Demo\BIN';
  GlobalCEFApp.PathLocalesDirPath   := arqIni.ReadString('CONFIG', 'LOCALES', '');  //'C:\TInject\Projeto-TInject-master\Demo\BIN\locales';
  GlobalCEFApp.Pathcache            := arqIni.ReadString('CONFIG', 'CACHE', ''); //'C:\TInject\Projeto-TInject-master\Demo\BIN\Cache';
  GlobalCEFApp.PathUserDataPath     := arqIni.ReadString('CONFIG', 'USERDATA', ''); //'C:\TInject\Projeto-TInject-master\Demo\BIN\User Data';
 }

  //Forma 1 GlobalCEFApp.Pathxx       := '';                        //Irá procurar o Arquivo PADRAO no mesmo local do EXE
  //Forma 2 GlobalCEFApp.Pathxx       := 'C:\Componentes\demo\bin'; //<-  NOME do ARQUIVO INFORMADO
  //Forma 3 GlobalCEFApp.Pathxx       := 'BIN';                     //<-  NOME do ARQUIVO INFORMADO
  //Forma 4 GlobalCEFApp.Pathx         := '..\Source\;              //<-  NOME do ARQUIVO INFORMADO
  //Exemplo se aplica para todos os PATH

  try
    aIni  := Tinifile.Create(ExtractFilePath(Application.ExeName) + 'ConfTInject.ini');

    aIni.WriteString('Path Defines', 'FrameWork', ExtractFilePath(Application.ExeName) + 'CEF');
    aIni.WriteString('Path Defines', 'Binary', ExtractFilePath(Application.ExeName) + 'CEF');
    aIni.WriteString('Path Defines', 'Locales', ExtractFilePath(Application.ExeName) + 'CEF\locales');
    aIni.WriteString('Path Defines', 'Cache', ExtractFilePath(Application.ExeName) + 'CEF\cache');
    aIni.WriteString('Path Defines', 'Data User', ExtractFilePath(Application.ExeName) + 'CEF\User Data');
    aIni.WriteString('Path Defines', 'Log Console', ExtractFilePath(Application.ExeName) + 'CEF\LogTinject\');
    aIni.WriteString('Path Defines', 'Log File', ExtractFilePath(Application.ExeName) + 'CEF');
    aIni.WriteString('Path Defines', 'Auto Receiver attached Path', ExtractFilePath(Application.ExeName) + 'CEF');

  finally
    aIni.Free;
  end;


  If not GlobalCEFApp.StartMainProcess then
     Exit;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

end.
