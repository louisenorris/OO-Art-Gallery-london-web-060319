class Artist

  attr_reader :name, :years_experience

  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    Painting.all.select{|painting| painting.artist == self }
  end

  def galleries
    paintings.map{|painting| painting.gallery }
  end

  def cities
    galleries.map{|painting| painting.city }
  end

  def self.total_experience
    Artist.all.sum(&:years_experience).to_i
  end

  def prolific
    (paintings.count.to_f / self.years_experience)
  end

  def self.most_prolific
    Artist.all.max_by{|artist| artist.prolific }
  end

  def self.create_painting(title, price, gallery)
    Painting.new(self, title, price, gallery)
  end

end
