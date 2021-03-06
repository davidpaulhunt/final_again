class Player < ActiveRecord::Base

  has_one :account, as: :accountable
  has_and_belongs_to_many :positions, foreign_key: :player_id, join_table: :players_positions

  has_many :sports, through: :positions

  has_many :stats, through: :player_stats
  has_many :player_stats

  has_many :favorite_schools, -> { limit(5) }

  has_one :video

  accepts_nested_attributes_for :account

  # scope :active, -> { Player.joins(:accounts).where(active: true) }

  def highlights
    if video
      @video = Video.find(video.id)
      @original_video = @video.panda_video
      @h264e = @original_video.encodings['h264']
    end
  end

  def update_positions(ids)
    ids.each do |id|
      positions << Position.find(id.to_i) unless positions.include?(Position.find(id.to_i))
    end
    update_player_stats
  end

  def update_player_stats
    sports.uniq.each do |sport|
      sport.stats.each do |stat|
        PlayerStat.create(value: 0, stat_id: stat.id, player_id: self.id) unless self.stats.include?(Stat.find(stat.id))
      end
    end
  end

  def favorited(school)
    @current = []
    favorite_schools.each do |fav|
      @current.push(fav.school)
    end
    @current.include?(school)
  end

  def self.quarterbacks
    Position.where(name: "quarterback").first.players
  end

  def self.runningbacks
    Position.where(name: "running back").first.players
  end

  def self.receivers
    Position.where(name: "wide receiver").first.players
  end

  def self.tightends
    Position.where(name: "tight end").first.players
  end

  def self.tackles
    Position.where(name: "offensive tackle").first.players
  end

  def self.guards
    Position.where(name: "offensive guard").first.players
  end

  def self.centers
    Position.where(name: "center").first.players
  end

  # passing

  # returns user's total passing yards
  def passing_yards
    stats.pluck(:passing_yards).reduce(:+)
  end

  # returns user's total passing attempts
  def passing_attempts
    stats.pluck(:passing_attempts).reduce(:+)
  end

  # returns user's yearly completions total
  def passing_completions
    stats.pluck(:passing_completions).reduce(:+)
  end

  # returns user's yearly touchdown total
  def passing_touchdowns
    stats.pluck(:passing_touchdowns).reduce(:+)
  end

  # returns user's yearly interception total
  def passing_interceptions
    stats.pluck(:passing_interceptions).reduce(:+)
  end

  # returns user's yearly completion percentage
  def passing_completion_percentage
    (passing_completions.to_f / passing_attempts).round(2)
  end

  # returns user's average yard per passing attempt
  def passing_yards_per_attempt
    (passing_yards.to_f / passing_attempts).round(1)
  end

  # rushing

  # returns user's total number of rushing yards
  def rushing_yards
    stats.pluck(:rushing_yards).reduce(:+)
  end

  # returns user's total number of rushing attempts
  def rushing_attempts
    stats.pluck(:rushing_attempts).reduce(:+)
  end

  # returns user's total number of rushing touchdowns
  def rushing_touchdowns
    stats.pluck(:rushing_touchdowns).reduce(:+)
  end

  # returns user's average yards per rushing attempt
  def rushing_yards_per_attempt
    (rushing_yards.to_f / rushing_attempts).round(1)
  end

end