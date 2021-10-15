module Gio
  # Defines a Unix mount point (e.g. <filename>/dev</filename>).
  # This corresponds roughly to a fstab entry.
  class UnixMountPoint
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(UnixMountPoint.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(UnixMountPoint.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_unix_mount_point_get_type
    end

    def compare(mount2 : Gio::UnixMountPoint) : Int32
      # g_unix_mount_point_compare: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_mount_point_compare(self, mount2)
      _retval
    end

    def copy : Gio::UnixMountPoint
      # g_unix_mount_point_copy: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_unix_mount_point_copy(self)
      Gio::UnixMountPoint.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # g_unix_mount_point_free: (Method)
      # Returns: (transfer none)

      LibGio.g_unix_mount_point_free(self)
    end

    def device_path : ::Path
      # g_unix_mount_point_get_device_path: (Method)
      # Returns: (transfer none Filename)

      _retval = LibGio.g_unix_mount_point_get_device_path(self)
      ::Path.new(::String.new(_retval))
    end

    def fs_type : ::String
      # g_unix_mount_point_get_fs_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_mount_point_get_fs_type(self)
      ::String.new(_retval)
    end

    def mount_path : ::Path
      # g_unix_mount_point_get_mount_path: (Method)
      # Returns: (transfer none Filename)

      _retval = LibGio.g_unix_mount_point_get_mount_path(self)
      ::Path.new(::String.new(_retval))
    end

    def options : ::String?
      # g_unix_mount_point_get_options: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_mount_point_get_options(self)
      ::String.new(_retval) unless _retval.null?
    end

    def guess_can_eject : Bool
      # g_unix_mount_point_guess_can_eject: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_mount_point_guess_can_eject(self)
      GICrystal.to_bool(_retval)
    end

    def guess_icon : Gio::Icon
      # g_unix_mount_point_guess_icon: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_unix_mount_point_guess_icon(self)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def guess_name : ::String
      # g_unix_mount_point_guess_name: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_unix_mount_point_guess_name(self)
      GICrystal.transfer_full(_retval)
    end

    def guess_symbolic_icon : Gio::Icon
      # g_unix_mount_point_guess_symbolic_icon: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_unix_mount_point_guess_symbolic_icon(self)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def is_loopback : Bool
      # g_unix_mount_point_is_loopback: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_mount_point_is_loopback(self)
      GICrystal.to_bool(_retval)
    end

    def is_readonly : Bool
      # g_unix_mount_point_is_readonly: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_mount_point_is_readonly(self)
      GICrystal.to_bool(_retval)
    end

    def is_user_mountable : Bool
      # g_unix_mount_point_is_user_mountable: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_mount_point_is_user_mountable(self)
      GICrystal.to_bool(_retval)
    end

    def self.at(mount_path : ::String) : Gio::UnixMountPoint?
      # g_unix_mount_point_at: (None)
      # @time_read: (out) (transfer full) (optional)
      # Returns: (transfer full)

      time_read = Pointer(UInt64).null

      _retval = LibGio.g_unix_mount_point_at(mount_path, time_read)
      Gio::UnixMountPoint.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def to_unsafe
      @pointer
    end
  end
end