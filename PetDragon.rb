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
      puts @name + " is not hungry!"
      @spoiled += 1
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
    end
    passingOfTime
  end

  def play
    puts @name + " is having fun!"
    if @spoiled > 0
      @spoiled -= 2
    end
    2.times do
      passingOfTime
    end
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
      @sleepy = 0
    else
      puts @name + " is not sleepy and refuses to sleep!"
      @spoiled += 1
      passingOfTime
    end
  end

  private

  def spoiled?
    @spoiled >= 10
  end

  def hungry?
    @fullness <= 4
  end

  def poopy?
    @poopy >= 7
  end

  def sleepy?
    @sleepy >= 7
  end

  def passingOfTime
    if spoiled?
      puts @name + " has become spoiled and decides to eat you!"
      exit
    end

    if sleepy?
      puts @name + " looks tired."
      @spoiled += 1
    end

    if @fullness > 0
      @fullness -= 1
      @poopy += 1
    else
      @spoiled += 2
    end

    if @asleep
      if hungry?
        puts @name + " woke up from a grumbling tummy."
        @asleep = false
      end
      if poopy?
        puts @name + " woke up and looks around restlessly!"
        @asleep = false
      end
    end
  end

end

puts "Please enter your dragon's name: "
dragon = PetDragon.new gets.chomp

while true
  puts "Commands:\n feed\n walk\n play\n sleep\n"
  action = gets.chomp

  case action
  when "feed"
    dragon.feed
  when "walk"
    dragon.walk
  when "play"
    dragon.play
  when "sleep"
    dragon.putToBed
  else
    puts "Invalid command."
  end

end
