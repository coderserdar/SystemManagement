unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel,
  AdvGlassButton, RzShellDialogs, ShellAPI;

type
  TfrmMain = class(TForm)
    grbWindows: TRzGroupBox;
    btnShutDown: TAdvGlassButton;
    btnRestart: TAdvGlassButton;
    btnLogOff: TAdvGlassButton;
    dlgFolderSelect: TRzSelectFolderDialog;
    grbFun: TRzGroupBox;
    btnAimp: TAdvGlassButton;
    btnMp3Tag: TAdvGlassButton;
    grbProgramming: TRzGroupBox;
    btnDocOMatic: TAdvGlassButton;
    btnSQLServer: TAdvGlassButton;
    btnIBExpert: TAdvGlassButton;
    btnCodeBank: TAdvGlassButton;
    procedure btnLogOffClick(Sender: TObject);
    procedure btnRestartClick(Sender: TObject);
    procedure btnShutDownClick(Sender: TObject);
    procedure btnAimpClick(Sender: TObject);
    procedure btnMp3TagClick(Sender: TObject);
    procedure btnDocOMaticClick(Sender: TObject);
    procedure btnSQLServerClick(Sender: TObject);
    procedure btnIBExpertClick(Sender: TObject);
    procedure btnCodeBankClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

// buradaki metot
// Windows oturumunu kapatmaya yarýyor

procedure TfrmMain.btnLogOffClick(Sender: TObject);
var
  dialog: TForm;
begin
  dialog := CreateMessageDialog('Are You Sure To Log Off', mtConfirmation, mbOKCancel);
  if dialog.ShowModal = mrOk then
  begin
    ExitWindowsEx(EWX_LOGOFF, 0);
  end;
end;

// buradaki metot
// windows'u yeniden baþlatmaya yarýyor

procedure TfrmMain.btnRestartClick(Sender: TObject);
var
  dialog: TForm;
begin
  dialog := CreateMessageDialog('Are You Sure To Restart Windows', mtConfirmation, mbOKCancel);
  if dialog.ShowModal = mrOk then
  begin
    ExitWindowsEx(EWX_REBOOT, 0);
  end;
end;

// buradaki metot
// windows'u kapatmaya yarýyor

procedure TfrmMain.btnShutDownClick(Sender: TObject);
var
  dialog: TForm;
begin
  dialog := CreateMessageDialog('Are You Sure To Shut Down Windows', mtConfirmation, mbOKCancel);
  if dialog.ShowModal = mrOk then
  begin
    ExitWindowsEx(EWX_POWEROFF, 0);
  end;
end;

// bu metotla
// seçilen klasörü aimp programý ile çalmaya baþlýyor

procedure TfrmMain.btnAimpClick(Sender: TObject);
var
  aimpPath: string;
begin
  aimpPath := FileSearch('AIMP2.exe', 'C:\Program Files (x86)\AIMP2');
  if aimpPath <> '' then
  begin
    dlgFolderSelect.Execute;
    if dlgFolderSelect.SelectedPathName <> '' then
    begin
      // burada üçüncü parametre, çalýþtýrýlacak uygulamanýn adresini ve adýný
      // dördüncü parametre ise uygulamaya verilecek parametreleri içeriyor
      ShellExecute(Handle, 'open', PAnsiChar(aimpPath),
        PAnsiChar('/DIR ' + dlgFolderSelect.SelectedPathName),
        PAnsiChar(aimpPath), SW_SHOWNORMAL);
    end;
  end;
end;

// bu metotla da
// müzik dosyalarýnýn etiket bilgilerini düzenlediðimiz
// mp3tag programýný düzenleyeceðimiz dosyalarýn klasörünü seçerek açýyoruz

procedure TfrmMain.btnMp3TagClick(Sender: TObject);
var
  mp3TagPath: string;
begin
  mp3TagPath := FileSearch('Mp3tag.exe', 'C:\Program Files (x86)\Mp3tag');
  if mp3TagPath <> '' then
  begin
    dlgFolderSelect.Execute;
    if dlgFolderSelect.SelectedPathName <> '' then
    begin
      // burada üçüncü parametre, çalýþtýrýlacak uygulamanýn adresini ve adýný
      // dördüncü parametre ise uygulamaya verilecek parametreleri içeriyor
      ShellExecute(Handle, 'open', PAnsiChar(mp3TagPath),
        PAnsiChar('/fp ' + dlgFolderSelect.SelectedPathName),
        PAnsiChar(mp3TagPath), SW_SHOWNORMAL);
    end;
  end;
end;

// bu metotla
// Doc-O-Matic denilen dokümantasyon programý çalýþtýrýlýyor
procedure TfrmMain.btnDocOMaticClick(Sender: TObject);
var
  path: string;
begin
  path := FileSearch('dom.exe', 'C:\Program Files (x86)\Doc-O-Matic 6 Professional');
  if path <> '' then
  begin
      // burada üçüncü parametre, çalýþtýrýlacak uygulamanýn adresini ve adýný
      // dördüncü parametre ise uygulamaya verilecek parametreleri içeriyor
    ShellExecute(Handle, 'open', PAnsiChar(path),
      nil,
      PAnsiChar(path), SW_SHOWNORMAL);
  end;
end;


// bu metotla
// SQL Server Management Studio denilen program çalýþtýrýlýyor
procedure TfrmMain.btnSQLServerClick(Sender: TObject);
var
  path: string;
begin
  path := FileSearch('Ssms.exe',
  'C:\Program Files (x86)\Microsoft SQL Server\100\Tools\Binn\VSShell\Common7\IDE');
  if path <> '' then
  begin
      // burada üçüncü parametre, çalýþtýrýlacak uygulamanýn adresini ve adýný
      // dördüncü parametre ise uygulamaya verilecek parametreleri içeriyor
    ShellExecute(Handle, 'open', PAnsiChar(path),
      nil,
      PAnsiChar(path), SW_SHOWNORMAL);
  end;
end;

// bu metotla
// Firebird veritabanlarý yönetim programý
// IBExpert'in açýlmasý saðlanýyor
procedure TfrmMain.btnIBExpertClick(Sender: TObject);
var
  path: string;
begin
  path := FileSearch('ibexpert.exe',
  'C:\Program Files (x86)\HK-Software\IBExpert');
  if path <> '' then
  begin
      // burada üçüncü parametre, çalýþtýrýlacak uygulamanýn adresini ve adýný
      // dördüncü parametre ise uygulamaya verilecek parametreleri içeriyor
    ShellExecute(Handle, 'open', PAnsiChar(path),
      nil,
      PAnsiChar(path), SW_SHOWNORMAL);
  end;
end;

// bu metotla
// Delphi Code Bank denilen programý çalýþtýrýyoruz
procedure TfrmMain.btnCodeBankClick(Sender: TObject);
var
  path: string;
begin
  path := FileSearch('DelphiUltimateBank.exe',
  'C:\Program Files (x86)\FREE\Ultimate Delphi CodeBank');
  if path <> '' then
  begin
      // burada üçüncü parametre, çalýþtýrýlacak uygulamanýn adresini ve adýný
      // dördüncü parametre ise uygulamaya verilecek parametreleri içeriyor
    ShellExecute(Handle, 'open', PAnsiChar(path),
      nil,
      PAnsiChar(path), SW_SHOWNORMAL);
  end;
end;

end.

