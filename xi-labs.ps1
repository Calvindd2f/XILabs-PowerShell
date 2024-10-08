function Get-TTSConvert
{
    [Alias('tts.convert', 'Invoke-TTSConversion', 'iTTS', 'iConvTTS', 'TTS')]
    <#
        .SYNOPSIS
        API that converts text into lifelike speech.

        .DESCRIPTION
        API that converts text into lifelike speech with best-in-class latency & uses the most advanced AI audio model ever.
        Create voiceovers for your videos, audiobooks, or create AI chatbots for free.

        .PARAMETER xi_api_key
        Your API key. This is required by most endpoints to access our API programatically. You can view your xi-api-key using the 'Profile' tab on the website.

        .PARAMETER voice_id
        Voice ID to be used, you can use https://api.elevenlabs.io/v1/voices to list all the available voices.

        .PARAMETER stream
        Parameter description

        .PARAMETER enable_logging
        When enable_logging is set to false full privacy mode will be used for the request.
        This will mean history features are unavailable for this request, including request stitching. Full privacy mode may only be used by enterprise customers.

        .PARAMETER optimize_streaming_latency
        You can turn on latency optimizations at some cost of quality.
        The best possible final latency varies by model.

        Possible values:
        0 - default mode (no latency optimizations)
        1 - normal latency optimizations (about 50% of possible latency improvement of option 3)
        2 - strong latency optimizations (about 75% of possible latency improvement of option 3)
        3 - max latency optimizations
        4 - max latency optimizations, but also with text normalizer turned off for even more latency savings (best latency, but can mispronounce eg numbers and dates).

        Defaults to None.

        .PARAMETER output_format
        string | default: mp3_44100_128

        Output format of the generated audio.

        Must be one of:
        mp3_22050_32 - output format, mp3 with 22.05kHz sample rate at 32kbps.
        mp3_44100_32 - output format, mp3 with 44.1kHz sample rate at 32kbps.
        mp3_44100_64 - output format, mp3 with 44.1kHz sample rate at 64kbps. mp3_44100_96 - output format, mp3 with 44.1kHz sample rate at 96kbps.
        mp3_44100_128 - default output format, mp3 with 44.1kHz sample rate at 128kbps.
        mp3_44100_192 - output format, mp3 with 44.1kHz sample rate at 192kbps. Requires you to be subscribed to Creator tier or above.
        pcm_16000 - PCM format (S16LE) with 16kHz sample rate.
        pcm_22050 - PCM format (S16LE) with 22.05kHz sample rate.
        pcm_24000 - PCM format (S16LE) with 24kHz sample rate.
        pcm_44100 - PCM format (S16LE) with 44.1kHz sample rate. Requires you to be subscribed to Pro tier or above.
        ulaw_8000 - μ-law format (sometimes written mu-law, often approximated as u-law) with 8kHz sample rate. Note that this format is commonly used for Twilio audio inputs.

        I should probably do ValidateParameterSet or whatever it is called but I haven't yet because I'm fucking lazy. I probably won't and will not leave a TODO on it but I'll happily accept PRs. Documenation is always last lol.

        .PARAMETER text
        text | string | required
        The text that will get converted into speech.

        .PARAMETER model_id
        model_id | string | default: eleven_monolingual_v1
        Identifier of the model that will be used, you can query them using GET /v1/models.
        he model needs to have support for text to speech, you can check this using the can_do_text_to_speech property.

        .PARAMETER lanuage_code
        Language code (ISO 639-1) used to enforce a language for the model.
        Currently only Turbo v2.5 supports language enforcement. For other models, an error will be returned if language code is provided.

        .FUNCTIONALITY
        voice_settings is an object.
        Voice settings overriding stored setttings for the given voice.
        They are applied only on the given request.

        Voice_Settings child attributes are :
            voice_settings.stability | number | required
            voice_settings.similarity_boost | number | required
            voice_settings.style | number | default: 0
            voice_settings.use_speaker_boost |  boolean | default: true
        [pscustomobject]$voice_settings=@{
            voice_settings__stability   =  50
            voice_settings__similarity_boost    =  50
            voice_settings__style  = 0
            voice_settings__use_speaker_boost   = 'true'
        }

        .PARAMETER voice_settings__stability
        voice_settings.stability | number | required

        .PARAMETER voice_settings__similarity_boost
        voice_settings.similarity_boost | number | required
        .PARAMETER voice_settings__style
        voice_settings.style | number | default: 0

        .PARAMETER voice_settings__use_speaker_boost
        voice_settings.use_speaker_boost |  boolean | default: true

        .FUNCTIONALITY
        pronunciation_dictionary_locators
        object[]
        A list of pronunciation dictionary locators (id, version_id) to be applied to the text.
        They will be applied in order.

        .PARAMETER pronunciation_dictionary_locators__pronunciation_dictionary_id
        pronunciation_dictionary_locators.pronunciation_dictionary_id
        string
        required

        .PARAMETER pronunciation_dictionary_locators__version_id
        pronunciation_dictionary_locators.version_id
        string
        required

        .PARAMETER seed
        integer

        If specified, our system will make a best effort to sample deterministically, such that repeated requests with the same seed and parameters should return the same result.
        Determinism is not guaranteed.

        .PARAMETER previous_text
        string

        The text that came before the text of the current request.
        Can be used to improve the flow of prosody when concatenating together multiple generations or to influence the prosody in the current generation.

        .PARAMETER next_text
        string

        The text that comes after the text of the current request.
        Can be used to improve the flow of prosody when concatenating together multiple generations or to influence the prosody in the current generation.

        .PARAMETER previous_request_ids
        string[]

        A list of request_id of the samples that were generated before this generation.
        Can be used to improve the flow of prosody when splitting up a large task into multiple requests.
        The results will be best when the same model is used across the generations.
        In case both previous_text and previous_request_ids is send, previous_text will be ignored.
        A maximum of 3 request_ids can be send.

        .PARAMETER next_request_ids
        string[]

        A list of request_id of the samples that were generated before this generation.
        Can be used to improve the flow of prosody when splitting up a large task into multiple requests.
        The results will be best when the same model is used across the generations.
        In case both next_text and next_request_ids is send, next_text will be ignored.
        A maximum of 3 request_ids can be send.

        .PARAMETER use_pvc_as_ivc
        boolean

        default: false

        deprecated

        If true, we won't use PVC version of the voice for the generation but the IVC version.
        This is a temporary workaround for higher latency in PVC versions.

        .EXAMPLE
        An example

        .NOTES
        General notes

        .OUTPUTS
        Response
        200 - audio/mpeg
        The response is of type file.

        .COMPONENT
        <xref:Microsoft.TextToSpeech.TextToSpeechClient>
        <xref:Microsoft.TextToSpeech.TextToSpeechClient.SynthesizeSpeechAsync>
        <xref:System.Web>
        <xref:System.Http>
        <xref:System.Net>

        .LINK
        https://elevenlabs.io/docs/api-reference/text-to-speech

        .EXTERNALHELP <https://elevenlabs.io/docs/api-reference/text-to-speech>

        .EXAMPLE
        TODO(@Calvindd2f): Need to create tests and shit. Before giving off examples

    #>
    param (
        [Parameter()]
        [string]
        $xi_api_key = $env:xi_api_key,

        [Parameter(Mandatory = $true)]
        [string]
        $voice_id,

        [Parameter()]
        [switch]
        $stream,

        [Parameter()]
        [bool]
        $enable_logging = $true,

        [Parameter()]
        [int]
        $optimize_streaming_latency,

        [Parameter()]
        [ValidateSet(
            'mp3_22050_32',
            'mp3_44100_32',
            'mp3_44100_64',
            'mp3_44100_128',
            'mp3_44100_192',
            'pcm_16000',
            'pcm_22050',
            'pcm_24000',
            'pcm_44100',
            'ulaw_8000'
        )]
        [string]
        $output_format = 'mp3_44100_128',

        [Parameter(Mandatory = $true)]
        [string]
        $text = '',

        [Parameter()]
        [string]
        $model_id = 'eleven_monolingual_v1',

        [Parameter()]
        [string]
        $lanuage_code = '',

        [Parameter]
        [switch]
        $voice_settings,

        [Parameter()]
        [int]
        $voice_settings__stability,

        [Parameter()]
        [int]
        $voice_settings__similarity_boost = '',

        [Parameter()]
        [int]
        $voice_settings__style = '',

        [Parameter()]
        [boolean]
        $voice_settings__use_speaker_boost = '',

        [Parameter()]
        [string]
        $pronunciation_dictionary_locators__pronunciation_dictionary_id,

        [Parameter()]
        [string]
        $pronunciation_dictionary_locators__version_id,

        [Parameter()]
        [int]
        $seed,

        [Parameter()]
        [string]
        $previous_text,

        [Parameter()]
        [string]
        $next_text,

        [Parameter()]
        [string[]]
        $previous_request_ids,

        [Parameter()]
        [string[]]
        $next_request_ids,

        [Parameter()]
        [bool]
        $use_pvc_as_ivc = $false #deprecated
    )

    begin
    {
        Add-Type -AssemblyName 'System.Net.Http';
        Add-Type -AssemblyName 'System.Text.Json';

        $url = "https://api.elevenlabs.io/v1/text-to-speech/${voice_id}"
        if ([switch]$stream)
        {
            $url = "https://api.elevenlabs.io/v1/text-to-speech/${voice_id}/stream"
        }

        if ($voice_settings)
        {
            if (!$voice_settings_stability) { $voice_settings_stability = 50 }
            if (!$voice_settings_similarity_boost) { $voice_settings_similarity_boost = 50 }
            if (!$voice_settings_style) { $voice_settings_style = 50 }
            if (!$voice_settings_use_speaker_boost) { $voice_settings_use_speaker_boost = 'true' }

            [pscustomobject]$voice_settings = @{
                voice_settings_stability         = $voice_settings_stability
                voice_settings_similarity_boost  = $voice_settings_similarity_boost
                voice_settings_style             = $voice_settings_style
                voice_settings_use_speaker_boost = $voice_settings_use_speaker_boost
            } | ConvertTo-Json
            $voice_settings
        }

        $httpClient = New-Object System.Net.Http.HttpClient
    }

    process
    {
        $request = [System.Net.HttpWebRequest]::Create($url)
        $request.header['Content-Type'] = 'application/json'
        $request.header['XI_API_Key'] = $env:xi_api_key
        $request.Headers['Accept'] = 'application/json'
        $request.Method = 'POST'

        # Insert the body stuff here

        $response = $request.GetRequestStreamAsync().Result
        $response = $request.GetResponseAsync().Result

        if ($response -gt 0)
        {
            try
            {
                $fileStream = [System.IO.File]::OpenWrite($outputFile)

                $stream = $webClient.OpenRead($url)
                $buffer = New-Object byte[] $chunkSize
                while (($bytesRead = $stream.Read($buffer, 0, $buffer.Length)) -gt 0)
                {
                    $fileStream.Write($buffer, 0, $bytesRead)
                }
            }
            finally
            {
                # Close and dispose of resources
                if ($stream) { $stream.Dispose() }
                if ($fileStream) { $fileStream.Dispose() }
                if ($webClient) { $webClient.Dispose() }
            }
        }
    }

    end
    {
        $request.Dispose
    }
}

function Get-SoundGeneration
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER xi_api_key
    Parameter description
    .PARAMETER Body
    Parameter description
    .PARAMETER duration_second
    Parameter description
    .PARAMETER prompt_influence
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    param (
        [Parameter()]
        [string]
        $xi_api_key,

        [Parameter()]
        [string]
        $Body = '',

        [Parameter()]
        [float]
        $duration_second,

        [Parameter()]
        [float]
        $prompt_influence = 0.3
    )

    begin
    {
        # https://elevenlabs.io/docs/api-reference/sound-generation
        $url = 'https://api.elevenlabs.io/v1/sound-generation'
    }

    process
    {
        $body = [pscustomobject]@{
            [string]$Body            = $Body
            [float]$duration_second  = $duration_second
            [float]$prompt_influence = $prompt_influence
        }



        $request.Method = 'POST'
    }

    end
    {
        print('The response is of type file.')
        print('200 - audio/mpeg')
    }
}

function Get-AudioIsolation
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER xi_api_key
    Parameter description
    .PARAMETER audio_file
    Parameter description
    .PARAMETER stream
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $xi_api_key,

        [Parameter()]
        [object]
        $audio_file,

        [Parameter()]
        [switch]
        $stream
    )
    begin
    {
        # https://elevenlabs.io/docs/api-reference/audio-isolation
        $url = 'https://api.elevenlabs.io/v1/audio-isolation'
        if ([switch]$stream)
        {
            $url = 'https://api.elevenlabs.io/v1/audio-isolation/stream'
        }
    }

    process
    {
        $method = 'POST'
        header['Content-Type'] = 'multipart/form-data'
        $Body = @(
            $audio_file
        )
    }

    end
    {}
}

function Get-GeneratedItems
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER xi_api_key
    Parameter description
    .PARAMETER start_after_history_item_id
    Parameter description
    .PARAMETER voice_id
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $xi_api_key,

        [Parameter()]
        [string]
        $start_after_history_item_id,

        [Parameter()]
        [string]
        $voice_id

    )
    begin
    {
        # GET https://api.elevenlabs.io/v1/history
        $request.method = 'GET';
        $url = 'https://api.elevenlabs.io/v1/history'
        $body = @{
            'voice_id'                    = $voice_id
            'start_after_history_item_id' = $start_after_history_item_id
        }
    }

    process
    {}

    end
    {}
}

function Get-HistoryItemById
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER XI_API_Key
    Parameter description
    .PARAMETER history_item_id
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $XI_API_Key,

        [Parameter]
        [string]
        $history_item_id #path # required
    )
    begin
    {
        #GET /v1/history/{history_item_id}
    }

    process
    {}

    end
    {}
}

function Delete-HistoryItem
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER XI_API_Key
    Parameter description
    .PARAMETER history_item_id
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter()]
        [string]
        $XI_API_Key,

        # Parameter help description
        [Parameter(Mandatory = $true)]
        [string]
        $history_item_id
    )
    begin
    {
        #DELETE/v1/history/{history_item_id}
    }

    process
    {}

    end
    {}
}

function Get-AudioFromHistoryItem
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER XI_API_Key
    Parameter description
    .PARAMETER history_item_id
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $XI_API_Key,

        [parameter()]
        [string]
        $history_item_id
    )
    begin
    {
        #GET /v1/history/${history_item_id}/audio
    }

    process
    {}

    end
    {}
}
function Download-HistoryItems
{
    <#
    .SYNOPSIS
    #
    .DESCRIPTION
    Long description
    .PARAMETER XI_API_Key
    Parameter description
    .PARAMETER history_item_ids
    Parameter description
    .PARAMETER output_format
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $XI_API_Key,

        [Parameter]
        [string[]]
        $history_item_ids,

        [Parameter()]
        [object]
        $output_format
    )
    begin
    {
        #POST /v1/history/download
    }

    process
    {}

    end
    {}
}

## Get User Info
function Get-UserInfo
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER XI_API_Key
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [string]
        $XI_API_Key = $env:xi_api_key
    )
    begin
    {
        $url = 'https://api.elevenlabs.io/v1/user'
    }
    process
    {
    }
    end
    {
        print($response.text)
    }
}

## Get User Subscription Info
function Get-UserSubscriptionInfo
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER XI_API_Key
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [string]
        $XI_API_Key = $env:xi_api_key
    )
    begin
    {
        $url = 'https://api.elevenlabs.io/v1/user/subscription'
        $request.Headers['XI_API_Key'] = $XI_API_Key
        $request.method = 'GET'
        $httpClient = New-Object System.Net.Http.HttpClient;
    }
    process
    {
        $response = requests.request('GET', $url)
    }
    end
    {
        print($response.text)
    }
}

function Get-Models
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER XI_API_Key
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $XI_API_Key
    )
    begin
    {
        #GET /v1/models
        #$url https://api.elevenlabs.io/v1/models
    }

    process
    {}

    end
    {}
}

function Get-Voices
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER ParameterName
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $ParameterName
    )

    begin
    {
        <#
        GET /v1/voices
        [string]XI_API_Key
        [boolean]show_legacy=false
        #>
    }

    process
    {}

    end
    {}
}
function Get-DefaultVoiceSettings
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER ParameterName
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $ParameterName
    )
    # GET /v1/voices/settings/default

    begin
    {}

    process
    {}

    end
    {}
}

function Get-VoiceSettings
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER ParameterName
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $ParameterName
    )
    <#
    GET /v1/voices/${voice_id}/settings
    [string]XI_API_Key
    [string]voice_id*
    #>

    begin
    {}

    process
    {}

    end
    {}
}
function Get-Voice
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER ParameterName
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $ParameterName
    )
    <#
        GET /v1/voices/${voice_id}
    [string]XI_API_Key
    [string]voice_id*                       #required
    [bool]with_settings=false
    #>

    begin
    {}

    process
    {}

    end
    {}
}

function Delete-Voice
{
    <#
    .SYNOPSIS
    #
    .DESCRIPTION
    Long description
    .PARAMETER ParameterName
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $ParameterName
    )

    <#
        DELETE /v1/voices/${voice_id}
        [string]XI_API_Key
        [string]voice_id*
    #>

    begin
    {}

    process
    {}

    end
    {}
}

function Edit-VoiceSettings
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER ParameterName
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $ParameterName
    )
    <#

    POST /v1/voices/${voice_id}/settings/edit
    [string]XI_API_Key
    [string]voice_id*

    header['Content-Type']= 'application/json'
    --data '{
        "stability": 123,
        "similarity_boost": 123,
        "style": 123,
        "use_speaker_boost": true
    }'
    #>

    begin
    {}

    process
    {}

    end
    {}
}

function Add-Voice
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER ParameterName
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $ParameterName
    )
    <#
        Add Voice
    POST /v1/voices/add
    [string]XI_API_Key

    url https://api.elevenlabs.io/v1/voices/add
    header 'Content-Type: multipart/form-data'
    form 'name=<string>'
    form 'files=[null]'
    form 'description=<string>'
    form 'labels=<string>'

    [object]$Body=@{
    [string]name
    [array]files
    [string]description
    [string]labels
    }

    #>

    begin
    {}

    process
    {}

    end
    {}
}

function Edit-Voice
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER XI_API_Key
    Parameter description
    .PARAMETER voice_id
    Parameter description
    .PARAMETER name
    Parameter description
    .PARAMETER files
    Parameter description
    .PARAMETER description
    Parameter description
    .PARAMETER labels
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $XI_API_Key,

        [Parameter()]
        [string]
        $voice_id,

        [Parameter()]
        [string]
        $name,

        [Parameter()]
        [string]
        $files,

        [Parameter()]
        [string]
        $description,

        [Parameter()]
        [string]
        $labels
    )

    begin
    {
        $Uri = "https://api.elevenlabs.io/v1/voices/${voice_id}/edit"
        $Body = @{
            'name'        = $name
            'files'       = $files
            'description' = $description
            'labels'      = $labels
        }
        $Body = [Pscustomobject]$Body
    }

    process
    {
        try
        {
            $request = [System.Net.HttpWebRequest]::Create($Uri)
            $request.Method = 'POST'
            $request.ContentType = 'multipart/form-data'
            $request.Accept = 'application/json'

            if (Token)
            {
                $request.Headers['Authorization'] = "Bearer $Token"
            }

            foreach ($key in $Headers.Keys)
            {
                $request.Headers[$key] = $Headers[$key]
            }

            $jsonBody = ConvertTo-Json -Depth 10 $Body
            $requestWriter = New-Object System.IO.StreamWriter $request.GetRequestStream()
            $requestWriter.Write($jsonBody)
            $requestWriter.Flush()
            $requestWriter.Close()

            $response = $request.GetResponse()
            $reader = New-Object System.IO.StreamReader $response.GetResponseStream()
            $result = $reader.ReadToEnd()
            $response.Dispose()

            return $result | ConvertFrom-Json
        }
        catch
        {
            Write-Host "Error: $$($_.Exception.Message)"
            return $null
        }
    }

    end
    {}
}

function Generate-A-RandomVoice
{
    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .PARAMETER XI_API_Key
    Parameter description
    .PARAMETER text
    Parameter description
    .PARAMETER accent_strength
    Parameter description
    .PARAMETER accent
    Parameter description
    .PARAMETER gender
    Parameter description
    .PARAMETER age
    Parameter description
    .EXAMPLE
    An example
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $XI_API_Key,

        [Parameter(Mandatory = $true)]
        [string]
        [ValidateScipe({
                if ($text.Length -lt 100)
                {
                    throw "Text must be at least 100 characters long."
                }
                elseif ($text.Length -gt 1000)
                {
                    throw "Text must be at most 1000 characters long."
                }
                else
                {
                    $true
                }
            })]
        $text,

        [Parameter(Mandatory = $true)]
        [ValidateScipe({
                if ($accent_strength -lt 0.3)
                {
                    throw 'accent_strength minimum value is 0.3.'
                }
                elseif ($accent_strength -gt 2.0)
                {
                    throw 'accent_strength max value is 2.0.'
                }
                else
                {
                    $true
                }
            })]
        [float]
        $accent_strength,

        [Parameter(Mandatory = $true)]
        [ValidateSetAttribute('american', 'british', 'african', 'australian', 'indian')]
        [string]
        $accent,

        [Parameter(Mandatory = $true)]
        [ValidateSetAttribute('female', 'male')]
        [string]
        $gender,

        [Parameter(Mandatory = $true)]
        [ValidateSetAttribute('young', 'middle_aged', 'old ')]
        [string]
        $age
    )

    begin
    {
        $Uri = 'https://api.elevenlabs.io/v1/voice-generation/generate-voice'
        $Body = @{
            'gender'          = $gender
            'accent'          = $accent
            'age'             = $age
            'accent_strength' = $accent_strength
            'text'            = $text
        }
        $Body = [Pscustomobject]$Body
    }

    process
    {
        try
        {
            $request = [System.Net.HttpWebRequest]::Create($Uri)
            $request.Method = 'POST'
            $request.ContentType = 'application/json'
            $request.Accept = 'application/json'

            if ($XI_API_Key)
            {
                $request.Headers['Authorization'] = "Bearer $Token"
            }

            foreach ($key in $Headers.Keys)
            {
                $request.Headers[$key] = $Headers[$key]
            }

            $jsonBody = ConvertTo-Json -Depth 10 $Body
            $requestWriter = New-Object System.IO.StreamWriter $request.GetRequestStream()
            $requestWriter.Write($jsonBody)
            $requestWriter.Flush()
            $requestWriter.Close()

            $response = $request.GetResponse()
            $reader = New-Object System.IO.StreamReader $response.GetResponseStream()
            $result = $reader.ReadToEnd()
            $response.Dispose()

            return $result | ConvertFrom-Json
        }
        catch
        {
            Write-Host "Error: $($_.Exception.Message)"
            return $null
        }

    }

    end
    {
        print('The response is of type file. | 200 - audio/mpeg')
    }
}

function Voice-GenerationParameters
{
    <#
        .SYNOPSIS
        Short description
        .DESCRIPTION
        Long description
        .EXAMPLE
        An example
        .NOTES
        General notes
    #>
    begin
    {
        $Uri = 'https://api.elevenlabs.io/v1/voice-generation/generate-voice/parameters'
    }

    process
    {
        try
        {
            $request = [System.Net.HttpWebRequest]::Create($Uri)
            $request.Method = 'GET'
            $request.ContentType = 'application/json'
            $request.Accept = 'application/json'

            foreach ($key in $Headers.Keys)
            {
                $request.Headers[$key] = $Headers[$key]
            }

            $response = $request.GetResponse()
            $reader = New-Object System.IO.StreamReader $response.GetResponseStream()
            $result = $reader.ReadToEnd()
            $response.Dispose()
        }
        catch
        {
            Write-Host "Error: $($_.Exception.Message)"
            return $null
        }
    }

    end
    {
        return $result | ConvertFrom-Json
    }
}
