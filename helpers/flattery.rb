class FlatteryQuotes

  @@flatteryquotes = [
    'Using this?  You are a genius.',
    'If you are using this app, you are making a wise choice.',
    'Checking your balance? High five to you, my friend.',
    'Checking up on your money? Smart move.',
    'Using Chockit? Brilliant, brilliant, brilliant.',
    'Well done.',
    'Most people do not use Chockit.  Most people are also not on their way to becoming billionaires.',
    'You are making wise moves.',
    'If you can read this message, you are making wise financial decisions.',
    'Most people do not use Chockit.  Most people are idiots.',
    'Using Chockit? I like your style.',
    'Keeping track of your money? Smart move.',

  ]

  def self.random()
    random_flattery = @@flatteryquotes.sample
    return random_flattery
  end

end
