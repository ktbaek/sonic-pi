use_bpm 120

## define drum sounds

define :play_kick do |vol|
  sample :drum_bass_hard, amp: vol
end

define :play_metronome do |vol|
  sample :elec_blip, amp: vol
end

define :play_snare do |vol|
  sample :drum_snare_soft, amp: vol
end

define :play_triangle do |vol|
  sample :elec_triangle, amp: vol
end

define :play_hats do |vol|
  sample :drum_cymbal_closed, amp: vol
end

## set volume categories

ghost = -> { rrand(0.2, 0.3) }
normal = -> { rrand(0.4, 0.6) }
accent = -> { rrand(0.8, 0.9) }



define :beats do |drum, trigger, at, vol|
  ## the method takes as parameters:
  ## drum = which instrument (drum) to use
  ## trigger = whether the index number or kick (on or off-beat) triggers the drum
  ## at = which indeces or kicks triggers the drum
  ## vol = volume
  
  
  if at.include? trigger
    send(drum, vol.call)
  end
end


define :interval do |index|
  ## defines the swing
  
  swing_time = 0.1
  
  if(index % 2) == 0
    # offbeats need to be slightly late for swing
    sleep (0.5 - swing_time)
  else
    sleep (0.5 + swing_time)
  end
end


define :play_beat do
  ## this is the sequencer
  loop do
    [1, 0, 1, 0, 1, 0, 1, 0].each.with_index(1) do |kick, index|
      
      beats(:play_kick, kick, at = [1], normal)
      beats(:play_hats, kick, at = [0], ghost)
      beats(:play_metronome, index, at = [1], normal)
      beats(:play_triangle, index, at = [1,3,4,5,7,8], ghost) if rand < 0.8
      beats(:play_snare, index, at = [3,7], normal)
      beats(:play_snare, index, at = [8], ghost) if rand < 0.1
      
      interval(index)
      
    end
  end
end


loop do
  play_beat
end