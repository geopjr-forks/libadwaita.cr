require "../g_object-2.0/object"
require "./action_group"

require "./remote_action_group"

module Gio
  # #GDBusActionGroup is an implementation of the #GActionGroup
  # interface that can be used as a proxy for an action group
  # that is exported over D-Bus with g_dbus_connection_export_action_group().
  class DBusActionGroup < GObject::Object
    include ActionGroup
    include RemoteActionGroup

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_action_group_get_type
    end

    def self.get(connection : Gio::DBusConnection, bus_name : ::String?, object_path : ::String) : Gio::DBusActionGroup
      # g_dbus_action_group_get: (None)
      # @bus_name: (nullable)
      # Returns: (transfer full)

      bus_name = if bus_name.nil?
                   Pointer(LibC::Char).null
                 else
                   bus_name.to_unsafe
                 end

      _retval = LibGio.g_dbus_action_group_get(connection, bus_name, object_path)
      Gio::DBusActionGroup.new(_retval, GICrystal::Transfer::Full)
    end
  end
end