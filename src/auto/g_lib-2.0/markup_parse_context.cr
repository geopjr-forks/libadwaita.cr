module GLib
  # A parse context is used to parse a stream of bytes that
  # you expect to contain marked-up text.
  #
  # See g_markup_parse_context_new(), #GMarkupParser, and so
  # on for more details.
  class MarkupParseContext
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(MarkupParseContext.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(MarkupParseContext.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_markup_parse_context_get_type
    end

    def initialize(parser : GLib::MarkupParser, flags : GLib::MarkupParseFlags, user_data : Pointer(Nil)?, user_data_dnotify : Pointer(Void))
      # g_markup_parse_context_new: (Constructor)
      # @user_data: (nullable)
      # Returns: (transfer full)

      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      _retval = LibGLib.g_markup_parse_context_new(parser, flags, user_data, user_data_dnotify)
      @pointer = _retval
    end

    def end_parse : Bool
      # g_markup_parse_context_end_parse: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGLib.g_markup_parse_context_end_parse(self)
      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # g_markup_parse_context_free: (Method)
      # Returns: (transfer none)

      LibGLib.g_markup_parse_context_free(self)
    end

    def element : ::String
      # g_markup_parse_context_get_element: (Method)
      # Returns: (transfer none)

      _retval = LibGLib.g_markup_parse_context_get_element(self)
      ::String.new(_retval)
    end

    def position : Nil
      # g_markup_parse_context_get_position: (Method)
      # @line_number: (out) (transfer full) (optional)
      # @char_number: (out) (transfer full) (optional)
      # Returns: (transfer none)

      line_number = Pointer(Int32).null
      char_number = Pointer(Int32).null

      LibGLib.g_markup_parse_context_get_position(self, line_number, char_number)
    end

    def user_data : Pointer(Nil)?
      # g_markup_parse_context_get_user_data: (Method)
      # Returns: (transfer none)

      _retval = LibGLib.g_markup_parse_context_get_user_data(self)
      Pointer(Void) unless _retval.null?
    end

    def parse(text : ::String, text_len : Int64) : Bool
      # g_markup_parse_context_parse: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGLib.g_markup_parse_context_parse(self, text, text_len)
      GICrystal.to_bool(_retval)
    end

    def pop : Pointer(Nil)?
      # g_markup_parse_context_pop: (Method)
      # Returns: (transfer none)

      _retval = LibGLib.g_markup_parse_context_pop(self)
      Pointer(Void) unless _retval.null?
    end

    def push(parser : GLib::MarkupParser, user_data : Pointer(Nil)?) : Nil
      # g_markup_parse_context_push: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGLib.g_markup_parse_context_push(self, parser, user_data)
    end

    def ref : GLib::MarkupParseContext
      # g_markup_parse_context_ref: (Method)
      # Returns: (transfer full)

      _retval = LibGLib.g_markup_parse_context_ref(self)
      GLib::MarkupParseContext.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_markup_parse_context_unref: (Method)
      # Returns: (transfer none)

      LibGLib.g_markup_parse_context_unref(self)
    end

    def to_unsafe
      @pointer
    end
  end
end