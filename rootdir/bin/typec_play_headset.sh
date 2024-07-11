echo "enabling headphone"
tinymix 'RX_MACRO RX0 MUX' 'AIF1_PB'
tinymix 'RX_MACRO RX1 MUX' 'AIF1_PB'
tinymix 'RX_CDC_DMA_RX_0 Channels' 'Two'
tinymix 'RX INT0_1 MIX1 INP0' 'RX0'
tinymix 'RX INT1_1 MIX1 INP0' 'RX1'
tinymix 'RX INT0 DEM MUX' 'CLSH_DSM_OUT'
tinymix 'RX INT1 DEM MUX' 'CLSH_DSM_OUT'
tinymix 'RX_HPH_PWR_MODE' 'LOHIFI'
tinymix 'RX HPH Mode' 'CLS_H_LOHIFI'
tinymix 'RX_COMP1 Switch' 0
tinymix 'RX_COMP2 Switch' 0
tinymix 'HPHL_COMP Switch' 0
tinymix 'HPHR_COMP Switch' 0
tinymix 'HPHL_RDAC Switch' 1
tinymix 'HPHR_RDAC Switch' 1
tinymix 'RX_RX0 Digital Volume' 84
tinymix "RX_RX1 Digital Volume" 84
tinymix 'HPHL Volume' 20
tinymix 'HPHR Volume' 20
tinymix 'RX_CDC_DMA_RX_0 Audio Mixer MultiMedia1' 1
tinyplay /vendor/etc/RES1K.wav


echo "disabling headphone"
tinymix 'RX_MACRO RX0 MUX' 'ZERO'
tinymix 'RX_MACRO RX1 MUX' 'ZERO'
tinymix 'RX_CDC_DMA_RX_0 Channels' 'One'
tinymix 'RX INT0_1 MIX1 INP0' 'ZERO'
tinymix 'RX INT1_1 MIX1 INP0' 'ZERO'
tinymix 'RX INT0 DEM MUX' 'NORMAL_DSM_OUT'
tinymix 'RX INT1 DEM MUX' 'NORMAL_DSM_OUT'
tinymix 'RX_COMP1 Switch' 0
tinymix 'RX_COMP2 Switch' 0
tinymix 'HPHL_COMP Switch' 0
tinymix 'HPHR_COMP Switch' 0
tinymix 'HPHL_RDAC Switch' 0
tinymix 'HPHR_RDAC Switch' 0
tinymix 'RX_CDC_DMA_RX_0 Audio Mixer MultiMedia1' 0

