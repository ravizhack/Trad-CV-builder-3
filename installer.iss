; ═══════════════════════════════════════════════════════════
;   Trad CV Builder — Inno Setup Script
;   Creates a professional, portable Windows installer (.exe)
;   Compatible with Windows 10, 11 and any PC
; ═══════════════════════════════════════════════════════════

#define MyAppName "Trad CV Builder"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "Trad CV Builder Team"
#define MyAppURL "https://github.com"
#define MyAppExeName "Trad CV Builder.exe"

[Setup]
; App Identity
AppId={{9F5B2F10-6C2A-4D7F-8B53-7629F1A4E90B}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}

; Install directory: User's local AppData programs (requires no admin privileges!)
DefaultDirName={userpf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes

; Output Configuration
OutputDir=dist
OutputBaseFilename=Trad_CV_Builder_Setup_v1.0
SetupIconFile=app.ico
Compression=lzma2/ultra64
SolidCompression=yes

; UI & Modern Aesthetics
WizardStyle=modern
DisableWelcomePage=no
PrivilegesRequired=lowest
UninstallDisplayIcon={app}\{#MyAppExeName}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; Main Executable
Source: "Trad CV Builder.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "index.html"; DestDir: "{app}"; Flags: ignoreversion
Source: "app.ico"; DestDir: "{app}"; Flags: ignoreversion

; CSS Files
Source: "css\*"; DestDir: "{app}\css"; Flags: ignoreversion recursesubdirs createallsubdirs

; JS Files
Source: "js\*"; DestDir: "{app}\js"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\app.ico"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\app.ico"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
