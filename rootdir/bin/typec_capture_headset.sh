# sample usage: playback_capture_headset.sh
VOCALTRACT=$1

echo "enabling headset mic"

        tinymix 'TX DEC0 MUX' 'SWR_MIC'
        tinymix 'TX SMIC MUX0' 'SWR_MIC4'
        tinymix 'TX_CDC_DMA_TX_3 Channels' 'One'
        tinymix 'TX_AIF1_CAP Mixer DEC0' '1'
        tinymix 'DEC0_BCS Switch' '1'
        tinymix 'ADC2_MIXER Switch' '1'
        tinymix 'ADC2 MUX' 'INP2'
        tinymix 'ADC2 ChMap' 'SWRM_TX2_CH1'
        tinymix 'MBHC ChMap' 'SWRM_TX2_CH2'
        tinymix 'BCS Channel' 'CH5'

tinymix 'MultiMedia1 Mixer TX_CDC_DMA_TX_3' 1
tinymix 'TX_CDC_DMA_TX_3 SampleRate' KHZ_48

# start recording
tinycap /data/data/test1_$VOCALTRACT.wav -r 48000 -b 16 -T 6 &
sleep 6

echo "disabling headset mic"
        tinymix 'ADC2 ChMap' 'ZERO'
        tinymix 'TX DEC0 MUX' 'ZERO'
        tinymix 'TX SMIC MUX0' 'ZERO'
        tinymix 'TX_CDC_DMA_TX_3 Channels' 'One'
        tinymix 'TX_AIF1_CAP Mixer DEC0' 0
        tinymix 'ADC2_MIXER Switch' 0
        tinymix 'ADC2 MUX' 'ZERO'


tinymix 'MultiMedia1 Mixer TX_CDC_DMA_TX_3' 0
tinymix 'TX_CDC_DMA_TX_3 SampleRate' 'KHZ_48'

