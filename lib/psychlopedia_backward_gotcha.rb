# encoding: utf-8

# taken from https://github.com/seejohnrun/gotcha/blob/master/gotchas/backward_gotcha.rb
class PsychlopediaBackwardGotcha < Gotcha::Base
  MIN_STRING_LENGTH = 4
  MAX_STRING_LENGTH = 6

  CHARS = ('a'..'z').to_a + ('0'..'9').to_a

  def initialize
    string_length = rand(MAX_STRING_LENGTH - MIN_STRING_LENGTH) + MIN_STRING_LENGTH
    string = (0...string_length).collect { CHARS[Kernel.rand(CHARS.length)] }.join

    @question = I18n.t('psychlopedia.gotcha.question', gotcha: string)
    @answer = string.reverse
  end
end
