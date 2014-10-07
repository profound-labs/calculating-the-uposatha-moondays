#!/usr/bin/env ruby

require 'date'

class MyDate < Date

#  def initialize
#    super
#  end

  def cs_year
    self.year - 638
  end

  # TODO: these should be instance vars
  def kat
    a = (self.cs_year * 292207) + 373
    horakhun = (a/800 + 1).floor
    kammacubala = 800 - a % 800
    #uccabala = (horakhun + 2611) % 3232
    avoman = ((horakhun*11) + 650) % 692
    thaloengsok = ((((horakhun*11) + 650) / 692).floor + horakhun) % 30
    [ kammacubala, avoman, thaloengsok ]
  end

  # TODO: this is bad Ruby
  def kammacubala
    (self.kat)[0]
  end

  def avoman
    (self.kat)[1]
  end

  def thaloengsok
    (self.kat)[2]
  end

  def is_suriya_leap?
    self.kammacubala <= 207
  end

  def is_adhikamat?
    t = self.thaloengsok
    (t >= 25 && t <= 29) || (t >= 0 && t <= 6)
  end

  def would_be_adhikawan?
    if self.is_suriya_leap?
      self.avoman <= 126
    else
      self.avoman <= 137
    end
  end

  def has_carried_adhikawan?
    last_year = MyDate.parse("#{self.year-1}-01-01")
    last_year.is_adhikamat? && last_year.would_be_adhikawan?
  end

  def is_adhikawan?
    unless self.is_adhikamat?
      if self.has_carried_adhikawan?
        true
      else
        self.would_be_adhikawan?
      end
    else
      false
    end
  end

end

(1958..2040).each do |y|
  d = MyDate.parse("#{y}-01-01")
  type = ' '
  if d.is_adhikamat?
    type = 'm'
  elsif d.is_adhikawan?
    type = 'd'
  end

  puts "#{y} #{d.cs_year} - #{type} - #{d.kat.join(',')}"
end

