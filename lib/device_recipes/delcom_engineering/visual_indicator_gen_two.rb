module Blinky
  module DelcomEngineering
    module VisualIndicator
      module GenerationII

        def success!
          off! 
          set_colour("\x06") 
        end

        def failure!  
          off!
          set_colour("\x05") 
        end

        def building!
          off!  
          set_colour("\x03")
        end

        def warning!
          off!
          set_colour("\x04")
        end

        def off!
          set_colour("\x07")  
        end

        def init
        end

        private
        def set_colour colour
          @handle.usb_control_msg(0x21, 0x09, 0x0635, 0x000, "\x65\x0C\xFF#{colour}\x00\x00\x00\x00", 0)
        end
      end
    end
  end
end
