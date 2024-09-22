# Eleven Labs API wrapper PowerShell

## Note

It is recommended to set the environment variable `$env:XI_API_KEY` as it will ensure that you do not have to enter the key foreach request.

-----------------------------------------

All of the primary functions of the API are available. For stream options, there is a switch input argument that redefines the URL when present. This is because the rest of the arguments are the same.

The public functions are as follows:

```txt
Get-TTSConvert
Get-SoundGeneration
Get-AudioIsolation
Get-GeneratedItems
Get-HistoryItemById
Delete-HistoryItem
Get-AudioFromHistoryItem
Download-HistoryItems
Get-UserInfo
Get-UserSubscriptionInfo
Get-Models
Get-Voices
Get-DefaultVoiceSettings
Get-VoiceSettings
Get-Voice
Delete-Voice
Edit-VoiceSettings
Add-Voice
Edit-Voice
Generate-A-RandomVoice
Voice-GenerationParameters
```

These funcitons all include validationattributes for each parameter and also validation set for the parameters including when the API demands and argument be required.

These functions all include help documenation that explains all purpose in heavy detail.

When `ALT+SPACE` searching for the functions the parameters are quite detailed.

```txt
┌──(c㉿CALVIN)-[]
└─PS> Get-TTSConvert
Get-TTSConvert

Get-TTSConvert [[-xi_api_key] <string>] [-voice_id] <string> [[-stream] <Parameter>] [[-enable_logging] <bool>] [[-optimize_streaming_latency] <int>] [[-output_format] <string>] [-text] <string> [[-model_id] <string>] [[-lanuage_code] <string>] [[-voice_settings__stability] <int>] [[-voice_settings__similarity_boost] <int>] [[-voice_settings__style] <int>] [[-voice_settings__use_speaker_boost] <bool>] [[-pronunciation_dictionary_locators__pronunciation_dictionary_id] <string>] [[-pronunciation_dictionary_locators__version_id] <string>] [[-seed] <int>] [[-previous_text] <string>] [[-next_text] <string>] [[-previous_request_ids] <string[]>] [[-next_request_ids] <string[]>] [[-use_pvc_as_ivc] <bool>] [<CommonParameters>]
```

Anything the API determines `required` in turn as a parameter is currently `[Mandatory=$true]`.

I may change this to instead of mandatory presence something like `ValidateNotNullyOrEmpty`.

Doing `Get-Help` or even `help` or `man` and the PowerShell Cmdlet

**Note: this below example is sheerly explanatory and the actual function is subject to change ; without necessitating the update of this in the README**
```txt

NAME
    Get-TTSConvert

SYNTAX
    Get-TTSConvert [[-xi_api_key] <string>] [-voice_id] <string> [[-enable_logging] <bool>] [[-optimize_streaming_latency] <int>] [[-output_format] <string>] [-text] <string> [[-model_id] <string>] [[-lanuage_code] <string>] [[-voice_settings__stability] <int>] [[-voice_settings__similarity_boost] <int>] [[-voice_settings__style] <int>] [[-voice_settings__use_speaker_boost] <bool>] [[-pronunciation_dictionary_locators__pronunciation_dictionary_id] <string>] [[-pronunciation_dictionary_locators__version_id] <string>] [[-seed] <int>] [[-previous_text] <string>] [[-next_text] <string>] [[-previous_request_ids] <string[]>] [[-next_request_ids] <string[]>] [[-use_pvc_as_ivc] <bool>] [-stream] [<CommonParameters>]


PARAMETERS
    -enable_logging <bool>

        Required?                    false
        Position?                    2
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -lanuage_code <string>

        Required?                    false
        Position?                    7
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -model_id <string>

        Required?                    false
        Position?                    6
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -next_request_ids <string[]>

        Required?                    false
        Position?                    18
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -next_text <string>

        Required?                    false
        Position?                    16
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -optimize_streaming_latency <int>

        Required?                    false
        Position?                    3
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -output_format <string>

        Required?                    false
        Position?                    4
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -previous_request_ids <string[]>

        Required?                    false
        Position?                    17
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -previous_text <string>

        Required?                    false
        Position?                    15
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -pronunciation_dictionary_locators__pronunciation_dictionary_id <string>

        Required?                    false
        Position?                    12
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -pronunciation_dictionary_locators__version_id <string>

        Required?                    false
        Position?                    13
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -seed <int>

        Required?                    false
        Position?                    14
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -stream

        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -text <string>

        Required?                    true
        Position?                    5
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -use_pvc_as_ivc <bool>

        Required?                    false
        Position?                    19
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -voice_id <string>

        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -voice_settings__similarity_boost <int>

        Required?                    false
        Position?                    9
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -voice_settings__stability <int>

        Required?                    false
        Position?                    8
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -voice_settings__style <int>

        Required?                    false
        Position?                    10
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -voice_settings__use_speaker_boost <bool>

        Required?                    false
        Position?                    11
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    -xi_api_key <string>

        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false

    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216).


INPUTS
    None


OUTPUTS
    System.Object

ALIASES
    tts.convert
    Invoke-TTSConversion
    iTTS
    iConvTTS
    TTS
    

REMARKS
    None


```