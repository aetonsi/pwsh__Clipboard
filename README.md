# pwsh__Clipboard
Powershell module containing clipboard related utils.

# Usage
```powershell
# Import module first
Import-Module ./Clipboard.psm1

# now you can use the imported functions
```

### Set-ClipboardSecurely
Sets the clipboard contents and tells the operating system not to store that content in its clipboard history (if in use)
> please note: it's up to the system to honor the request and not store the value

> please note: this also disables Windows from sharing the given value across the user's devices

> please note: currently ONLY Windows OS is supported

```powershell
Set-ClipboardSecurely "some secret value, like a password"
# to emtpy clipboard
Set-ClipboardSecurely ""
# or you can empty the clipboard via the system's Set-Clipboard, but this leaves an empty string in the system's history
Set-Clipboard ""

```
