# lua_syntax_check.ps1
# Checks syntax of all .lua files under scripts/actions/weaponskills using luac or lua
$luac = Get-Command luac -ErrorAction SilentlyContinue
$lua = Get-Command lua -ErrorAction SilentlyContinue
if ($luac) { $interp = $luac.Path; $isLuac = $true }
elseif ($lua) { $interp = $lua.Path; $isLuac = $false }
else { Write-Output 'NO_LUA_FOUND'; exit 2 }
Get-ChildItem -Path 'scripts/actions/weaponskills' -Filter '*.lua' -Recurse | ForEach-Object {
    $file = $_.FullName
    if ($isLuac) {
        $out = & $interp -p $file 2>&1
        if ($LASTEXITCODE -eq 0) { Write-Output ($file + ': OK') } else { Write-Output ($file + ': SYNTAX ERROR -> ' + $out) }
    } else {
        # Use lua to attempt loadfile; print result
        & $interp -e "local f,err=loadfile(arg[1]); if not f then print(arg[1]..': '..err) else print(arg[1]..': OK') end" $file
    }
}
