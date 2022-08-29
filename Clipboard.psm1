function Set-ClipboardSecurely {
    # https://github.com/keepassxreboot/keepassxc/blob/develop/src/gui/Clipboard.cpp
    # https://docs.microsoft.com/en-us/windows/win32/dataxchg/clipboard-formats#cloud-clipboard-and-clipboard-history-formats
    # https://www.reddit.com/r/PowerShell/comments/p2xmba/exclude_copied_text_from_clipboard_history/
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)] [AllowEmptyString()] [string] $SecureString
    )
    Add-Type -AssemblyName System.Windows.Forms
    $TempClipboardData = New-Object System.Windows.Forms.DataObject
    $TempClipboardData.SetData("ExcludeClipboardContentFromMonitorProcessing", $SecureString)
    $TempClipboardData.SetData([System.Windows.Forms.DataFormats]::Text, $SecureString)
    [System.Windows.Forms.Clipboard]::SetDataObject($TempClipboardData)
}


Export-ModuleMember -Function *
