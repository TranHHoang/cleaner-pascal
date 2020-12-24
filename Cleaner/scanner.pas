unit Scanner;

{$mode objfpc}{$H+}{$modeswitch advancedrecords}

interface

uses SysUtils, fgl;

type
  TFiles = record
    Name: String;
    Size: Int64;
    class operator = (a, b: TFiles): Boolean;
  end;
  TFileList = specialize TFPGList<TFiles>;

procedure GetFileInFolder(path: String; list: TFileList);

implementation

class operator TFiles.= (a, b: TFiles): Boolean;
begin
  Result := a.Name = b.Name;
end;

procedure GetFileInFolder(path: String; list: TFileList);
var
  item: TFiles;
  sr: TSearchRec;
begin
  if FindFirst(IncludeTrailingBackslash(path) + '*.*', faAnyFile or faDirectory, sr) = 0 then
  begin
    repeat
      if (sr.Attr and faDirectory) = 0 then
      begin
        item.Name := IncludeTrailingBackslash(path) + sr.Name;
        item.Size := sr.Size;
        list.Add(item);
      end
      else if (sr.Name <> '.') and (sr.Name <> '..') then
        GetFileInFolder(IncludeTrailingBackslash(path) + sr.Name, list);
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

end.

