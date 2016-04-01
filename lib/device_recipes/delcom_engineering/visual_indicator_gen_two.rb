module Blinky
  module DelcomEngineering
    module VisualIndicator
      module GenerationII

        def success!
          off! 
          set_colour(0xfe) 
        end

        def failure!  
          off!
          set_colour(0xfd) 
        end

        def building!
          off!  
          set_colour(0xfb)
        end

        def warning!
          off!
          set_colour(0xf4)
        end

        def off!
          set_colour(0xff)  
        end

        def init
        end

        private
        def set_colour colour
          @handle.usb_control_msg(0x21, 
                                  0x09, 
                                  0x0635, 
                                  0x000,
                                  [0x65, 0x0c, 0xff, colour, 0, 0, 0, 0].pack("C*"),
                                  0)
        end
      end
    end
  end
end
