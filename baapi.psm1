function Get-BaapiResource {
 param (
  [string]$Resource,
  [string]$Api = "http://baapi.globalbuild.rackspace.net/api"
 )
 try {
  $ErrorAction = 'Stop';
  $Error.Clear();

  $Controller = 'Resource';

 $ResourceUri = "$($Api)/$($Controller)/resource?provider=$($Resource)";

  Invoke-RestMethod -Method Get -UseBasicParsing -Uri $ResourceUri -ContentType 'application/json'

 } catch {
  throw $_;
 }
}

function New-BaapiResource {
 param (
  [string]$Endpoint,
  [string]$Api = "http://baapi.globalbuild.rackspace.net/api"
 )
 try {
  $ErrorAction = 'Stop';
  $Error.Clear();

  $Controller = 'Json';

 $ResourceUri = "$($Api)/$($Controller)/document";
 $body = New-Object -TypeName psobject -Property @{'schema'=$endpoint}

  Invoke-RestMethod -Method Post -UseBasicParsing -Uri $ResourceUri -body ($body |ConvertTo-Json -Compress) -ContentType 'application/json'

 } catch {
  throw $_;
 }
}
