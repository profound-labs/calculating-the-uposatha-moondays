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
  def kammacubala_avoman
    a = (self.cs_year * 292207) + 373
    horakhun = (a/800 + 1).floor
    kammacubala = 800 - a % 800
    #uccabala = (horakhun + 2611) % 3232
    avoman = ((horakhun*11) + 650) % 692
    [ kammacubala, avoman ]
  end

  # TODO: this is bad Ruby
  def kammacubala
    (self.kammacubala_avoman)[0]
  end

  def avoman
    (self.kammacubala_avoman)[1]
  end

  def is_suriya_leap?
    self.kammacubala <= 207
  end

  def is_adhikamat?
    [ 1320, 1323, 1326, 1328, 1331, 1334, 1337, 1339 ].include? self.cs_year
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

(1958..1978).each do |y|
  d = MyDate.parse("#{y}-01-01")
  if d.is_adhikamat?
    puts 'm'
  elsif d.is_adhikawan?
    puts 'd'
  else
    puts ' '
  end
end

