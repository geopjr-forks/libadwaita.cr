require "../g_object-2.0/object"

module Gio
  # Holds a password used in TLS.
  class TlsPassword < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, description : ::String? = nil, flags : Gio::TlsPasswordFlags? = nil, warning : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if description
        (_names.to_unsafe + _n).value = "description".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, description)
        _n += 1
      end
      if flags
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end
      if warning
        (_names.to_unsafe + _n).value = "warning".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, warning)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TlsPassword.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tls_password_get_type
    end

    def initialize(flags : Gio::TlsPasswordFlags, description : ::String)
      # g_tls_password_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_password_new(flags, description)
      @pointer = _retval
    end

    def description : ::String
      # g_tls_password_get_description: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_password_get_description(self)
      ::String.new(_retval)
    end

    def flags : Gio::TlsPasswordFlags
      # g_tls_password_get_flags: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_password_get_flags(self)
      Gio::TlsPasswordFlags.from_value(_retval)
    end

    def value(length : UInt64) : Enumerable(UInt8)
      # g_tls_password_get_value: (Method)
      # @length: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_password_get_value(self, length)
      _retval
    end

    def warning : ::String
      # g_tls_password_get_warning: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_password_get_warning(self)
      ::String.new(_retval)
    end

    def description=(description : ::String) : Nil
      # g_tls_password_set_description: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_tls_password_set_description(self, description)
    end

    def flags=(flags : Gio::TlsPasswordFlags) : Nil
      # g_tls_password_set_flags: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_tls_password_set_flags(self, flags)
    end

    def set_value(value : Enumerable(UInt8)) : Nil
      # g_tls_password_set_value: (Method)
      # @value: (array length=length element-type UInt8)
      # Returns: (transfer none)

      length = value.size
      value = value.to_a.to_unsafe

      LibGio.g_tls_password_set_value(self, value, length)
    end

    def set_value(*value : UInt8)
      set_value(value)
    end

    def set_value_full(value : Enumerable(UInt8), destroy : Pointer(Void)?) : Nil
      # g_tls_password_set_value_full: (Method)
      # @value: (array length=length element-type UInt8)
      # @destroy: (nullable)
      # Returns: (transfer none)

      length = value.size
      destroy = if destroy.nil?
                  LibGLib::DestroyNotify.null
                else
                  destroy.to_unsafe
                end
      value = value.to_a.to_unsafe

      LibGio.g_tls_password_set_value_full(self, value, length, destroy)
    end

    def warning=(warning : ::String) : Nil
      # g_tls_password_set_warning: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_tls_password_set_warning(self, warning)
    end
  end
end