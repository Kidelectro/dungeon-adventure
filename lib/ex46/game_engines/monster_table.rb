class MonsterTable
  MONSTERS = { 1 => Skeleton,
               2 => RatSwarm }


  def self.spawn_monster(lvl)
    key = rand(1..2)
    if MONSTERS.has_key?(key)
      MONSTERS[key].new(lvl)
    end
  end

end
