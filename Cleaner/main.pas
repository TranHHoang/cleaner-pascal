unit Main;

{$mode objfpc}{$H+}{$coperators on}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, ExtCtrls, RecycleBin, Converter, Scanner;

type

  { TFrmMain }

  TFrmMain = class(TForm)
    btnStart: TButton;
    Label1: TLabel;
    Label2: TLabel;
    lbStatus: TLabel;
    lbOverall: TLabel;
    lstDetails: TListView;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.lfm}

{ TFrmMain }

procedure TFrmMain.FormCreate(Sender: TObject);
var
  i: integer;
  list: TFileList;
  k: Int64 = 0;
begin
  list := TFileList.Create;
  ShowMessage(ContructExactPath('%localappdata%'));
  //
end;

end.

