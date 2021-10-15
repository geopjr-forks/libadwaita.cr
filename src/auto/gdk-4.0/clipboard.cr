require "../g_object-2.0/object"

module Gdk
  # The `GdkClipboard` object represents data shared between applications or
  # inside an application.
  #
  # To get a `GdkClipboard` object, use [method@Gdk.Display.get_clipboard] or
  # [method@Gdk.Display.get_primary_clipboard]. You can find out about the data
  # that is currently available in a clipboard using
  # [method@Gdk.Clipboard.get_formats].
  #
  # To make text or image data available in a clipboard, use
  # [method@Gdk.Clipboard.set_text] or [method@Gdk.Clipboard.set_texture].
  # For other data, you can use [method@Gdk.Clipboard.set_content], which
  # takes a [class@Gdk.ContentProvider] object.
  #
  # To read textual or image data from a clipboard, use
  # [method@Gdk.Clipboard.read_text_async] or
  # [method@Gdk.Clipboard.read_texture_async]. For other data, use
  # [method@Gdk.Clipboard.read_async], which provides a `GInputStream` object.
  class Clipboard < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, content : Gdk::ContentProvider? = nil, display : Gdk::Display? = nil, formats : Gdk::ContentFormats? = nil, local : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if content
        (_names.to_unsafe + _n).value = "content".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, content)
        _n += 1
      end
      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if formats
        (_names.to_unsafe + _n).value = "formats".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, formats)
        _n += 1
      end
      if local
        (_names.to_unsafe + _n).value = "local".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, local)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Clipboard.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_clipboard_get_type
    end

    def display=(value : Display?) : Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "display", unsafe_value, Pointer(Void).null)
      value
    end

    def content : Gdk::ContentProvider?
      # gdk_clipboard_get_content: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_clipboard_get_content(self)
      Gdk::ContentProvider.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def display : Gdk::Display
      # gdk_clipboard_get_display: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_clipboard_get_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    def formats : Gdk::ContentFormats
      # gdk_clipboard_get_formats: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_clipboard_get_formats(self)
      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::None)
    end

    def is_local : Bool
      # gdk_clipboard_is_local: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_clipboard_is_local(self)
      GICrystal.to_bool(_retval)
    end

    def read_async(mime_types : Enumerable(::String), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # gdk_clipboard_read_async: (Method)
      # @mime_types: (array zero-terminated=1 element-type Utf8)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      mime_types = mime_types.to_a.map(&.to_unsafe).to_unsafe

      LibGdk.gdk_clipboard_read_async(self, mime_types, io_priority, cancellable, callback, user_data)
    end

    def read_finish(result : Gio::AsyncResult) : Gio::InputStream?
      # gdk_clipboard_read_finish: (Method | Throws)
      # @out_mime_type: (out) (optional)
      # Returns: (transfer full)

      out_mime_type = Pointer(Pointer(LibC::Char)).null

      _retval = LibGdk.gdk_clipboard_read_finish(self, result, out_mime_type)
      Gio::InputStream.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def read_text_async(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # gdk_clipboard_read_text_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGdk.gdk_clipboard_read_text_async(self, cancellable, callback, user_data)
    end

    def read_text_finish(result : Gio::AsyncResult) : ::String?
      # gdk_clipboard_read_text_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_clipboard_read_text_finish(self, result)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def read_texture_async(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # gdk_clipboard_read_texture_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGdk.gdk_clipboard_read_texture_async(self, cancellable, callback, user_data)
    end

    def read_texture_finish(result : Gio::AsyncResult) : Gdk::Texture?
      # gdk_clipboard_read_texture_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_clipboard_read_texture_finish(self, result)
      Gdk::Texture.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def read_value_async(type : UInt64, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # gdk_clipboard_read_value_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGdk.gdk_clipboard_read_value_async(self, type, io_priority, cancellable, callback, user_data)
    end

    def read_value_finish(result : Gio::AsyncResult) : GObject::Value
      # gdk_clipboard_read_value_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_clipboard_read_value_finish(self, result)
      GObject::Value.new(_retval, GICrystal::Transfer::None)
    end

    def content=(provider : Gdk::ContentProvider?) : Bool
      # gdk_clipboard_set_content: (Method)
      # @provider: (nullable)
      # Returns: (transfer none)

      provider = if provider.nil?
                   Pointer(Void).null
                 else
                   provider.to_unsafe
                 end

      _retval = LibGdk.gdk_clipboard_set_content(self, provider)
      GICrystal.to_bool(_retval)
    end

    def set(value : _) : Nil
      # gdk_clipboard_set_value: (Method)
      # Returns: (transfer none)

      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      LibGdk.gdk_clipboard_set_value(self, value)
    end

    def store_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # gdk_clipboard_store_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGdk.gdk_clipboard_store_async(self, io_priority, cancellable, callback, user_data)
    end

    def store_finish(result : Gio::AsyncResult) : Bool
      # gdk_clipboard_store_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_clipboard_store_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    struct ChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Clipboard, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Clipboard.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Clipboard, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Clipboard, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Clipboard.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Clipboard, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end
  end
end