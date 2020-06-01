function git-status { & git status $args }
New-Alias -Force -Name gs -Value git-status

function git-branch { & git branch $args }
New-Alias -Force -Name gb -Value git-branch

function git-commit-msg { & git commit -m $args }
New-Alias -Force -Name gcmsg -Value git-commit-msg

function git-add-all { & git add -A $args }
New-Alias -Force -Name gaa -Value git-add-all

function git-checkout { & git checkout $args }
New-Alias -Force -Name gco -Value git-checkout

Remove-Item -Path Alias:\gcb

function git-checkout-branch { & git checkout -b $args }
New-Alias -Force -Name gcb -Value git-checkout-branch



Set-Alias rmt Remove-ItemSafely -Option AllScope
Set-Alias rm Remove-ItemSafely -Option AllScope


function git-remote-view { & git remote -v }
function git-remote-view-copy-to-clipboard { (& git remote -v | Select -First 1).Replace("origin", "").Replace("(fetch)", "").Trim() | Set-Clipboard  }

function git-sync {
    Param(
        [Alias("d")]
        [switch]$DeleteCurrentBranch,
        [Alias("m")]
        [string]$Message="sync",
        [Alias("s")]
        [switch]$SameRemote,
        [ArgumentCompleter( {
            param ( $commandName,
                    $parameterName,
                    $wordToComplete,
                    $commandAst,
                    $fakeBoundParameters )

            $localBranches = @(git for-each-ref --format='%(refname:short)' refs/heads/*)
            $localBranches | ForEach-Object {$_}
        } )]
        [Alias("w")]
        [string]$With="master"
    )
    $currentBranch = (git rev-parse --abbrev-ref HEAD)
    git add -A
    git commit -m $message
    if ($SameRemote) {
        git push origin $currentBranch
        return;
    }
    else {
        git checkout $With
        git merge $currentBranch
        git push origin $With
    }
    if ($DeleteCurrentBranch) {
        git branch -d $currentBranch
    }
    else {
        git checkout $currentBranch
    }
}


New-Alias -Force -Name grv -Value git-remote-view
New-Alias -Force -Name grvcpy -Value git-remote-view-copy-to-clipboard




New-Alias -Force -Name open -Value Invoke-Item
New-Alias -Force -Name which -Value Get-Command
New-Alias -Force -Name touch -Value New-Item


Set-Variable -Name "SCRUM" -Value 'C:\Users\hyahmed\OneDrive - MetroStar Systems Inc\work-docs\scrum.txt'

#$env:path += ";C:\Program Files (x86)\jdk-12.0.2\bin"
#$env:path += ";C:\Program Files\Ant\bin"
#$env:path += ";C:\Program Files (x86)\NUnit.org\nunit-console\"
#$env:path += ";C:\Users\hyahmed\Tools\SDK\Tools\PluginRegistration\"
#$env:path += ";C:\Users\hyahmed\Tools\coretools\"
#$env:path += ";C:\Users\hyahmed\scripts\"
#$env:path += ";C:\Program Files\Nuget\tools\"
#$env:path += ";C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\CommonExtensions\Microsoft\TestWindow\"
#$env:path += ";C:\Program Files\CMake\bin\"
#$env:path += ";C:\Users\hyahmed\source\tools\docfx.console.2.53.1\tools"
$env:path += ";C:\Program Files (x86)\Vim\vim82"


#Import-Module posh-git

function java-jar-bfg {
    (& java -jar $HOME\source\lib\bfg.jar $args)
}

function lsexe {
    ls -Filter *.exe
}

#New-Alias -Force -Name bfg -Value java-jar-bfg
#. ~\source\scripts\util.ps1

#Add-PSSnapin Microsoft.Xrm.Tooling.Connector

New-Alias -Force -Name gsy -Value git-sync
