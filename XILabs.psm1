#region Constants
################################# Define all constants here ###################################
$DefaultHTTPTimeout = 960 #16 minutes, 1 minute more than server timeout so we don't timeout before the server.
$DefaultMaxRetryTimes = 5 # In total we try 6 times. 1 original try, 5 retry attempts.
$DefaultRetryIntervalInMilliSeconds = 2000
$DefaultRetryIntervalExponentBase = 2
$DefaultPageSize = 1000
$RetryableHTTPResponses = @([System.Net.HttpStatusCode]::Unauthorized, [System.Net.HttpStatusCode]::ServiceUnavailable, [System.Net.HttpStatusCode]::GatewayTimeout)
$StringsForBooleanParsing = @('$true', '($true)', '$true)', '$false', '($false)', '$false)')
################################################################################################
#endregion

#region Global variables
################################################################################################
function ShouldUse-EnvironmentVariableForAPIByDefault
{
    if ($env:XI_API_KEY)
    { return $false }
    elseif ($XI_API_KEY)
    {
        $env:XI_API_KEY = $XI_API_KEY
    }
    else
    { return $true }
}
################################################################################################
#endregion

#region Constant Functions
################################################################################################
function const([string]$Name, [string]$Value)
{
    New-Variable -Name $Name -Value $Value -Option Constant -Force -Scope Script
}
function print([string]$InputObject)
{
    [console]::writeline([string]$InputObject)
}
################################################################################################
#endregion
