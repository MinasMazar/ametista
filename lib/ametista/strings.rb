module Ametista
  class ::String
    LAMERIZE = {
      'a' => '4',
      'e' => '3',
      'i' => '1',
      'o' => '0',
      't' => '7',
      'b' => '8',
      'g' => '9',
      's' => '5'
    }

    def fs_normalize
      downcase.gsub(' ', '_')
    end
    def lamerize
      LAMERIZE.inject(self) {|l_s, h| l_s.gsub h[0], h[1]}
    end

    def delamerize
      LAMERIZE.inject(self) {|l_s, h| l_s.gsub h[1], h[0]}
    end

  end
end
