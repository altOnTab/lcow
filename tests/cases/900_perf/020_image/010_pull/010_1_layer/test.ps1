# SUMMARY: Pull an image with one layer
# LABELS:
# REPEAT:

$libBase = Join-Path -Path $env:RT_PROJECT_ROOT -ChildPath _lib
$lib = Join-Path -Path $libBase -ChildPath lib.ps1
. $lib

$imageName = "linuxkit/test-lcow:1layer"

docker image pull --platform linux $imageName
if ($lastexitcode -ne 0) { exit 1 }
exit 0