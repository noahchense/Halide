# Get unix-style date in the path
$env:PATH += ";C:\Program Files (x86)\Git\bin"

$Date = date +%Y_%m_%d
$Log = "C:\Code\Halide\test\scripts\testlog.txt"

cd C:\Code\Halide\test\scripts

git pull
git checkout master

.\distrib_windows.ps1 | tee $Log

cd C:\Code\Halide\distrib

$Failed = $LastExitCode
if ($Failed) {
  $LogName = "logs_Windows_FAIL_" + $Date + ".txt"
} else {
  $LogName = "logs_Windows_PASS_" + $Date + ".txt"
}

move ${Log} ${LogName}

copy *${Date}.zip "C:\Users\user\Google Drive\Halide Binaries"
copy ${LogName} "C:\Users\user\Google Drive\Halide Binaries"