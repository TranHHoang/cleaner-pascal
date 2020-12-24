unit Converter;

{$mode objfpc}{$H+}

interface

uses SysUtils;

const
  KB = 1024;
  MB = KB * KB;
  GB = MB * KB;

function BytesToKB(number: Int64): Double;
function BytesToMB(number: Int64): Double;
function BytesToGB(number: Int64): Double;
function SizeToString(number: Int64): String;
function ContructExactPath(raw: String): String;

implementation

function BytesToKB(number: Int64): Double;
begin
  Result := number / KB;
end;

function BytesToMB(number: Int64): Double;
begin
  Result := number / MB;
end;

function BytesToGB(number: Int64): Double;
begin
  Result := number / GB;
end;

function SizeToString(number: Int64): String;
begin
  if number < KB then
    Result := Format('%.2f Bytes', [number])
  else if number < MB then
    Result := Format('%.2f KB', [number / KB])
  else if number < GB then
    Result := Format('%.2f MB', [number / MB])
  else
    Result := Format('%.2f GB', [number / GB]);
end;

(*
  Convert generic path like %temp% to exact path, i.e C:\Windows\Temp
*)
function ContructExactPath(raw: String): String;
var
  i: Integer = 1;
begin
  Result := '';
  while i <= Length(raw) do
  begin
    if raw[i] = '%' then
    begin
      Delete(raw, i, 1);
      Result += GetEnvironmentVariable(Copy(raw, i, Pos('%', raw) - 1));
      Delete(raw, 1, Pos('%', raw));
    end
    else
    begin
      Result += raw[i];
      Inc(i);
    end;
  end;
end;

end.

