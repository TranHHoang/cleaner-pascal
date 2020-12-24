program project1;

{$mode objfpc}{$H+}

uses
    {$IFDEF UNIX}{$IFDEF UseCThreads}
    cthreads,
    {$ENDIF}{$ENDIF}
    Interfaces, // this includes the LCL widgetset
    Forms, Main, RecycleBin, converter, scanner
    { you can add units after this };

{$R *.res}

begin
    Application.Scaled:=True;
    RequireDerivedFormResource:=True;
    Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
    Application.Run;
end.

