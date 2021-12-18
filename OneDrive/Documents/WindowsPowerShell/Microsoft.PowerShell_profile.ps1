# https://stackoverflow.com/a/59125287/625919
if ($env:TERM_PROGRAM -eq "vscode") {
  Set-PSReadLineKeyHandler -Chord 'Ctrl+w' -Function BackwardKillWord
}