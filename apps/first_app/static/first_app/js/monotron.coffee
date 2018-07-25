class Monotron
  constructor: (@context) ->
    ##set up audio nodes - vco, lfo, vcf......and gain nodes lfoGainm, output##
    @vco = @context.createOscillator()
    @lfo = @context.createOscillator()
    @lfoGain = @context.createGain()
    @vcf = @context.createBiquadFilter()
    @output = @context.createGain()

    ##connecting nodes to create the audio circuit##
    @vco.connect @vcf
    @vcf.connect @output
    @lfo.connect @lfoGain
    @lfoGain.connect @vcf.frequency

    ##must silence gain to start so it doesnt turn on as soon as it loads. 
    ## set the waveform type for oscillator and lfo
    ## then start oscillator and lfo upon load --- but master gain is down :D
    @output.gain.value = 0
    @vco.type = @vco.SAWTOOTH
    @lfo.type = @lfo.SAWTOOTH
    @vco.start @context.currentTime
    @lfo.start @context.currentTime


##trigger note with frequency change
  noteOn: (frequency, time) ->
    ##optional parameter so that it can be used with a sequencer, otherwise it is immediate ##
    time ?= @context.currentTime
    @vco.frequency.setValueAtTime frequency, time
    ##modulates output gain to avoid clicking at beginning of sound
    @output.gain.linearRampToValueAtTime 1.0, time + 0.1

  noteOff: (time) ->
    time ?= @context.currentTime
    @output.gain.linearRampToValueAtTime 0.0, time + 0.1

  connect: (target) ->
    @output.connect target