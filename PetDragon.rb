class PetDragon
  def initialize name
    @name = name
    @age = 0
    @sleepy = rand(2)
    @fullness = rand(8) + 2
    @poopy = rand(2)
    @asleep = false
    @spoiled = rand(3)

    puts @name + " the baby dragon is born!"
  end

  def feed
    if hungry?
      puts @name + " ate all the food!"
      @fullness = 10
      if spoiled > 0
        @spoiled -= 1
      end
    else
      puts @name " is not hungry!"
      @spoiled += 1
      spoiled
    end
    passingOfTime
  end

  def walk
    if poopy?
      puts @name + " did business outside like a good dragon!"
      @poopy = 0
      if spoiled > 0
        @spoiled -= 1
      end
    else
      puts @name + " did not need to do business."
      @spoiled += 1
      spoiled
    end
    passingOfTime
  end

  def putToBed
    if sleepy?
      puts @name + " went to sleep."
      @asleep = true
      3.times do
        if @asleep
          puts @name + " snores peacefully."
          passingOfTime
        end
      end
      if @asleep
        @asleep = false
      end
      if @spoiled > 0
        @spoiled -= 1
      end
    else
      puts @name + " is not sleepy and refuses to sleep!"
      @spoiled += 1
      spoiled
      passingOfTime
    end
  end

  private

  def spoiled
    if @spoiled >= 10
      puts @name + " is spoiled and decides to eat you!"
      exit
    end
  end

  def hungry?
    @fullness <= 6
  end

  def poopy?
    @poopy >= 7
  end

  def sleepy?
    @sleepy >= 7
  end

  def passingOfTime

  end

end

puts "Please enter your dragon's name: "
dragon = PetDragon.new gets.chomp

while true
  puts "Commands:\n feed\n walk\n sleep\n"
  action = gets.chomp

  case action
  when feed
    dragon.feed
  when walk
    dragon.walk
  when sleep
    dragon.putToBed
  else
    puts "Invalid command."
  end

end
