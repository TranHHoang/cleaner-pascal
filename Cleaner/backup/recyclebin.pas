unit RecycleBin;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils;

const
    shell32 = 'shell32.dll';

type
  PSHQueryRBInfo = ^TSHQueryRBInfo;
  TSHQueryRBInfo = packed record
    cbSize: DWORD;
    i64Size: Int64;
    i64NumItems: Int64;
  end;

function SHQueryRecycleBin(szRootPath: PChar; SHQueryRBInfo: PSHQueryRBInfo): HResult;
stdcall; external shell32 Name 'SHQueryRecycleBinA';

function GetRBSize: Int64;
function GetRBCount: Int64;

implementation

function GetRBSize: Int64;
var
    rbInfo: TSHQueryRBInfo;
    res: HRESULT;
begin
  FillChar(rbInfo, SizeOf(TSHQueryRBInfo), #0);
  rbInfo.cbSize := SizeOf(TSHQueryRBInfo);
  res := SHQueryRecycleBin(nil, @rbInfo);
  if res = S_OK then
    exit(rbInfo.i64Size);
  exit(0);
end;

function GetRBCount: Int64;
var
    rbInfo: TSHQueryRBInfo;
    res: HRESULT;
begin
  FillChar(rbInfo, SizeOf(TSHQueryRBInfo), #0);
  rbInfo.cbSize := SizeOf(TSHQueryRBInfo);
  res := SHQueryRecycleBin(nil, @rbInfo);
  if res = S_OK then
    exit(rbInfo.i64NumItems);
  exit(0);
end;

end.

