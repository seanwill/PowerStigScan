param(

    [Parameter(Mandatory=$true,Position=1)]
    [String]
    $ComputerName,

    [Parameter(Mandatory=$true)]
    [ValidateSet("IE11")]
    [String]
    $Role,

    [Parameter(Mandatory=$false)]
    [String]
    $StigVersion

)



configuration PowerStigBrowserCall
{
    Import-DscResource -ModuleName PowerStig -ModuleVersion 2.3.2.0

    Node $ComputerName  
    {
        Browser IE
        {
            BrowserVersion = $Role
            StigVersion = $StigVersion
            SkipRule = 'V-46477'
        } 
    }
}

PowerStigBrowserCall