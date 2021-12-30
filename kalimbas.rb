use_random_seed 55

2.times do
  sample :bd_boom, amp: 0.6, rate: 1.1
  sleep 2
end

in_thread(name: :bass) do
  12.times do
    7.times do
      sample :bd_boom, amp: 0.6, rate: 1.1
      sleep 2
    end
    2.times do
      sample :bd_boom, amp: 0.6, rate: 1.1
      sleep 1
    end
  end
  7.times do
    sample :bd_boom, amp: 0.4, rate: 1.1
    sleep 2
  end
  2.times do
    sample :bd_boom, amp: 0.4, rate: 1.1
    sleep 1
  end
  sample :bd_boom, amp: 0.3, rate: 1.1
end

in_thread(name: :kalimba1) do
  use_synth :kalimba
  val = 0
  while val < 184
    play choose([:g3, :a3, :c4, :d4, :e4, :g4, :a4, :c5]), pan: rrand(-1, 1), amp: rrand(0.5, 0.9)
    sv = choose([0.25, 0.25, 0.5, 0.5, 0.5, 0.75])
    sleep sv
    val += sv
  end
  play :c4, amp: 0.7
end

sleep 16

define :chord_player do |root, mm|
  play chord(root, mm), attack: 0.5, sustain: 0.5, release: 1, amp: 0.13
  sleep 4
end

in_thread(name: :chord) do
  4.times do
    chord_player(:C3, :major)
    chord_player(:A3, :minor)
    chord_player(:G3, :minor)
    chord_player(:F3, :major)
  end
  4.times do
    chord_player(:C3, :major)
    chord_player(:Bb2, :major)
    chord_player(:F3, :major)
    chord_player(:E3, :minor)
  end
  2.times do
    chord_player(:C3, :major)
    chord_player(:A3, :minor)
    chord_player(:G3, :minor)
    chord_player(:F3, :major)
  end
end

sleep 16

in_thread(name: :kalimba2) do
  use_synth :kalimba
  val = 0
  while val < 160
    play choose([:g4, :a4, :c5, :d5, :e5, :g5, :a5, :c6, :d6, :e6]), pan: rrand(-1, 1), amp: rrand(0.5, 0.9)
    sv = choose([0.25, 0.25, 0.25, 0.5, 0.5, 0.75])
    sleep sv
    val += sv
  end
  play :c5, amp: 0.7
end

sleep 16

in_thread(name: :kalimba3) do
  use_synth :kalimba
  val = 0
  while val < 160
    play choose([:g5, :a5, :c6, :d6, :e6, :g6, :a6, :c7]), pan: rrand(-1, 1), amp: rrand(0.5, 0.9)
    sv = choose([0.25, 0.25, 0.25, 0.25, 0.25, 0.5, 0.75])
    sleep sv
    val += sv
  end
  play :c7, amp: 0.7
end

