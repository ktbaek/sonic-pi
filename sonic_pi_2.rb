use_bpm 120

live_loop :kick do
  sample :bd_808, rate: 1.2, amp: 1, cutoff: 60, decay: 6
  sample :bd_haus, rate: 1.2, cutoff: 90
  sleep 1
end


live_loop :hats do
  sample :drum_cymbal_closed, amp: 0.3, release: 0.6, finish: 0.5
  sleep 0.5
end

live_loop :hats_off do
  sleep 3.75
  sample :drum_cymbal_closed, amp: 0.3, release: 0.6, finish: 0.3
  sleep 1.5
  sample :drum_cymbal_closed, amp: 0.3, release: 0.6, finish: 0.3
  sleep 2.5
  sample :drum_cymbal_closed, amp: 0.3, release: 0.6, finish: 0.3
  sleep 0.25
end



live_loop :snares do
  with_fx :reverb, pre_mix: 0.5, room: 0.5 do
    sleep 1
    sample :drum_snare_hard, amp: 0.4, cutoff: 110
    sleep 1
  end
end

#stop
live_loop :toms do
  sleep 1.5
  sample :drum_bass_hard, rate: 3, amp: 0.8
  sleep 2.5
  sample :drum_bass_hard, rate: 2, amp: 0.6, cutoff: 100
end

live_loop :echo_on_3 do
  sleep 2.5
  sample :loop_industrial, rate: 0.18, beat_stretch: 1.3, amp: 2, start: 0.05, finish: 0.29, lpf: 100
  sleep 1.5
  
end

live_loop :low do
  tick
  sleep 1.5
  synth :prophet, wave: 1, phase: 0.2, release: 2, amp: 0.4, note: :A2, cutoff: (line 60, 100, steps: 6).look
  synth :prophet, wave: 1, phase: 0.4, release: 2, amp: 0.4, note: :c2, cutoff: (line 60, 120, steps: 4).look
  sleep 2.5
end



