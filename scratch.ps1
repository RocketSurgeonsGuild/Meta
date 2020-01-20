
foreach ($item in gci src -Directory -Exclude Meta.Packages) {
  Push-Location $item;

  New-Item -Type Directory build -ErrorAction SilentlyContinue
  New-Item -Type Directory buildMultiTargeting -ErrorAction SilentlyContinue
  New-Item -Type Directory buildTransitive -ErrorAction SilentlyContinue
  if (-not (Test-Path "buildMultiTargeting\Rocket.Surgery.$($item.Name).props")) {
    New-Item -Type File "buildMultiTargeting\Rocket.Surgery.$($item.Name).props" -ErrorAction SilentlyContinue
    Set-Content "buildMultiTargeting\Rocket.Surgery.$($item.Name).props" @"
<Project>
  <Import Project="..\build\$(MSBuildThisFile)" />
</Project>
"@;
  }
  if (-not (Test-Path "buildMultiTargeting\Rocket.Surgery.$($item.Name).targets")) {
    New-Item -Type File "buildMultiTargeting\Rocket.Surgery.$($item.Name).targets" -ErrorAction SilentlyContinue
    Set-Content "buildMultiTargeting\Rocket.Surgery.$($item.Name).targets" @"
<Project>
  <Import Project="..\build\$(MSBuildThisFile)" />
</Project>
"@;
  }
  if (-not (Test-Path "buildTransitive\Rocket.Surgery.$($item.Name).props")) {
    New-Item -Type File "buildTransitive\Rocket.Surgery.$($item.Name).props" -ErrorAction SilentlyContinue
    Set-Content "buildTransitive\Rocket.Surgery.$($item.Name).props" @"
<Project>
<Import Project="..\build\$(MSBuildThisFile)" />
</Project>
"@;
  }
  if (-not (Test-Path "buildTransitive\Rocket.Surgery.$($item.Name).targets")) {
    New-Item -Type File "buildTransitive\Rocket.Surgery.$($item.Name).targets" -ErrorAction SilentlyContinue
    Set-Content "buildTransitive\Rocket.Surgery.$($item.Name).targets" @"
<Project>
<Import Project="..\build\$(MSBuildThisFile)" />
</Project>
"@;
  }
  if (-not (Test-Path "build\Rocket.Surgery.$($item.Name).props")) {
    New-Item -Type File "build\Rocket.Surgery.$($item.Name).props" -ErrorAction SilentlyContinue
    Set-Content "build\Rocket.Surgery.$($item.Name).props" @"
<Project>
</Project>
"@;
  }
  if (-not (Test-Path "build\Rocket.Surgery.$($item.Name).targets")) {
    New-Item -Type File "build\Rocket.Surgery.$($item.Name).targets" -ErrorAction SilentlyContinue
    Set-Content "build\Rocket.Surgery.$($item.Name).targets" @"
<Project>
</Project>
"@;
  }

  Pop-Location;
}
