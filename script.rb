require 'bloops'

class PI
  def self.digits
    k, a, b, a1, b1 = 2, 4, 1, 12, 4
    loop do
      p, q, k = k*k, 2*k+1, k+1
      a, b, a1, b1 = a1, b1, p*a+q*a1, p*b+q*b1
      d, d1 = a/b, a1/b1
      while d == d1
        yield d
        $stdout.flush
        a, a1 = 10*(a%b), 10*(a1%b1)
        d, d1 = a/b, a1/b1
      end
    end
  end
end

PI::digits do |digit|
  notes = ['c', 'd', 'e', 'f', 'g', 'a', 'b', 'c', 'd']
  wav_file = "#{notes[digit-1]}.wav"
  Thread.new {
    `afplay #{wav_file}`
  }
  sleep(0.4)
end
