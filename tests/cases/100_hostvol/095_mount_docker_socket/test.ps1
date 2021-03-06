# SUMMARY: Volume mount a single file into container
# LABELS:
# REPEAT:
# ISSUE: https://github.com/moby/moby/issues/35425

$libBase = Join-Path -Path $env:RT_PROJECT_ROOT -ChildPath _lib
$lib = Join-Path -Path $libBase -ChildPath lib.ps1
. $lib

$p = [string]$pwd.Path
docker container run --platform linux --rm `
  -v /var/run/docker.sock:/var/run/docker.sock `
  -v $p`:/test `
  alpine:3.7 sh /test/socket-test.sh
if ($lastexitcode -ne 0) { 
    exit 1
}

exit 0
