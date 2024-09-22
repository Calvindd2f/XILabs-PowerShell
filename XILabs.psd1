@{
    # If authoring a script module, the RootModule is the name of your .psm1 file
    RootModule           = 'XILabs.psm1'

    Author               = 'Calvin Bergin <@Calvindd2f>'

    CompanyName          = 'Calvindd2f'

    ModuleVersion        = '0'

    # Use the New-Guid command to generate a GUID, and copy/paste into the next line
    GUID                 = '72ffd716-a51f-4f74-8129-ee1818880496'

    Copyright            = '2024 Calvindd2f'

    Description          = 'Port of the elevenlabs.io api reference documentation in powershell. Heavily recommends setting the $env:XI_Labs_key, to not want to headbutt walls after each request.'

    # Minimum PowerShell version supported by this module (optional, recommended)
    PowerShellVersion    = '5.1'

    # Which PowerShell Editions does this module work with? (Core, Desktop)
    CompatiblePSEditions = @('Desktop', 'Core')

    # Which PowerShell functions are exported from your module? (eg. Get-CoolObject)
    FunctionsToExport    = @('')

    # Which PowerShell aliases are exported from your module? (eg. gco)
    AliasesToExport      = @('')

    # Which PowerShell variables are exported from your module? (eg. Fruits, Vegetables)
    VariablesToExport    = @('')

    # PowerShell Gallery: Define your module's metadata
    PrivateData          = @{
        PSData = @{
            # What keywords represent your PowerShell module? (eg. cloud, tools, framework, vendor)
            Tags         = @('Ai', 'XI', 'elevenlabs', 'Audio', 'Ai', 'cloud', 'tools', 'shitpost')

            # What software license is your code being released under? (see https:\opensource.org/licenses)
            LicenseUri   = ''

            # What is the URL to your project's website?
            ProjectUri   = ''

            # What is the URI to a custom icon file for your project? (optional)
            IconUri      = ''

            # What new features, bug fixes, or deprecated features, are part of this release?
            ReleaseNotes = @'
            Initial Pre-Release
'@
        }
    }

    # If your module supports updatable help, what is the URI to the help archive? (optional)
    HelpInfoURI          = 'https://elevenlabs.io/docs/api-reference'
}