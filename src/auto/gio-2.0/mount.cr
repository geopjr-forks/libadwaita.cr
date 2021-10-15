module Gio
  # The #GMount interface represents user-visible mounts. Note, when
  # porting from GnomeVFS, #GMount is the moral equivalent of #GnomeVFSVolume.
  #
  # #GMount is a "mounted" filesystem that you can access. Mounted is in
  # quotes because it's not the same as a unix mount, it might be a gvfs
  # mount, but you can still access the files on it if you use GIO. Might or
  # might not be related to a volume object.
  #
  # Unmounting a #GMount instance is an asynchronous operation. For
  # more information about asynchronous operations, see #GAsyncResult
  # and #GTask. To unmount a #GMount instance, first call
  # g_mount_unmount_with_operation() with (at least) the #GMount instance and a
  # #GAsyncReadyCallback.  The callback will be fired when the
  # operation has resolved (either with success or failure), and a
  # #GAsyncResult structure will be passed to the callback.  That
  # callback should then call g_mount_unmount_with_operation_finish() with the #GMount
  # and the #GAsyncResult data to see if the operation was completed
  # successfully.  If an @error is present when g_mount_unmount_with_operation_finish()
  # is called, then it will be filled with any error information.
  module Mount
    def can_eject : Bool
      # g_mount_can_eject: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_mount_can_eject(self)
      GICrystal.to_bool(_retval)
    end

    def can_unmount : Bool
      # g_mount_can_unmount: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_mount_can_unmount(self)
      GICrystal.to_bool(_retval)
    end

    def eject(flags : Gio::MountUnmountFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_mount_eject: (Method)
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

      LibGio.g_mount_eject(self, flags, cancellable, callback, user_data)
    end

    def eject_finish(result : Gio::AsyncResult) : Bool
      # g_mount_eject_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_mount_eject_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def eject_with_operation(flags : Gio::MountUnmountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_mount_eject_with_operation: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
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

      LibGio.g_mount_eject_with_operation(self, flags, mount_operation, cancellable, callback, user_data)
    end

    def eject_with_operation_finish(result : Gio::AsyncResult) : Bool
      # g_mount_eject_with_operation_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_mount_eject_with_operation_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def default_location : Gio::File
      # g_mount_get_default_location: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_mount_get_default_location(self)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def drive : Gio::Drive?
      # g_mount_get_drive: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_mount_get_drive(self)
      Gio::Drive__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def icon : Gio::Icon
      # g_mount_get_icon: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_mount_get_icon(self)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def name : ::String
      # g_mount_get_name: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_mount_get_name(self)
      GICrystal.transfer_full(_retval)
    end

    def root : Gio::File
      # g_mount_get_root: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_mount_get_root(self)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def sort_key : ::String?
      # g_mount_get_sort_key: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_mount_get_sort_key(self)
      ::String.new(_retval) unless _retval.null?
    end

    def symbolic_icon : Gio::Icon
      # g_mount_get_symbolic_icon: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_mount_get_symbolic_icon(self)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def uuid : ::String?
      # g_mount_get_uuid: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_mount_get_uuid(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def volume : Gio::Volume?
      # g_mount_get_volume: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_mount_get_volume(self)
      Gio::Volume__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def guess_content_type(force_rescan : Bool, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_mount_guess_content_type: (Method)
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

      LibGio.g_mount_guess_content_type(self, force_rescan, cancellable, callback, user_data)
    end

    def guess_content_type_finish(result : Gio::AsyncResult) : Enumerable(::String)
      # g_mount_guess_content_type_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_mount_guess_content_type_finish(self, result)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def guess_content_type_sync(force_rescan : Bool, cancellable : Gio::Cancellable?) : Enumerable(::String)
      # g_mount_guess_content_type_sync: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_mount_guess_content_type_sync(self, force_rescan, cancellable)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def is_shadowed : Bool
      # g_mount_is_shadowed: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_mount_is_shadowed(self)
      GICrystal.to_bool(_retval)
    end

    def remount(flags : Gio::MountMountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_mount_remount: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
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

      LibGio.g_mount_remount(self, flags, mount_operation, cancellable, callback, user_data)
    end

    def remount_finish(result : Gio::AsyncResult) : Bool
      # g_mount_remount_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_mount_remount_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def shadow : Nil
      # g_mount_shadow: (Method)
      # Returns: (transfer none)

      LibGio.g_mount_shadow(self)
    end

    def unmount(flags : Gio::MountUnmountFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_mount_unmount: (Method)
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

      LibGio.g_mount_unmount(self, flags, cancellable, callback, user_data)
    end

    def unmount_finish(result : Gio::AsyncResult) : Bool
      # g_mount_unmount_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_mount_unmount_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def unmount_with_operation(flags : Gio::MountUnmountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_mount_unmount_with_operation: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
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

      LibGio.g_mount_unmount_with_operation(self, flags, mount_operation, cancellable, callback, user_data)
    end

    def unmount_with_operation_finish(result : Gio::AsyncResult) : Bool
      # g_mount_unmount_with_operation_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_mount_unmount_with_operation_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def unshadow : Nil
      # g_mount_unshadow: (Method)
      # Returns: (transfer none)

      LibGio.g_mount_unshadow(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Mount__Impl
    include Mount

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_mount_get_type
    end

    # Cast a `GObject::Object` to `Mount`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Mount")
    end

    # Cast a `GObject::Object` to `Mount`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end