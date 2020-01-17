
foreach ($item in gci src -Directory -Exclude Meta.Packages) {
  Push-Location $item;

  New-Item -Type Directory Sdk -ErrorAction SilentlyContinue
  New-Item -Type File "Sdk\Sdk.props" -ErrorAction SilentlyContinue
  Set-Content "Sdk\Sdk.props" @"
<Project>
  <Import Project="$(MSBuildThisFileDirectory)\..\build\Rocket.Surgery.$($item.Name).props" />
</Project>
"@;

  New-Item -Type File "Sdk\Sdk.targets" -ErrorAction SilentlyContinue
  Set-Content "Sdk\Sdk.targets" @"
<Project>
  <Import Project="$(MSBuildThisFileDirectory)\..\build\Rocket.Surgery.$($item.Name).targets" />
</Project>
"@;

  Pop-Location;
}
