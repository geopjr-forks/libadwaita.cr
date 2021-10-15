require "../g_object-2.0/object"

module Gtk
  # `GtkEventController` is the base class for event controllers.
  #
  # These are ancillary objects associated to widgets, which react
  # to `GdkEvents`, and possibly trigger actions as a consequence.
  #
  # Event controllers are added to a widget with
  # [method@Gtk.Widget.add_controller]. It is rarely necessary to
  # explicitly remove a controller with [method@Gtk.Widget.remove_controller].
  #
  # See the chapter on [input handling](input-handling.html) for
  # an overview of the basic concepts, such as the capture and bubble
  # phases of even propagation.
  class EventController < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if propagation_limit
        (_names.to_unsafe + _n).value = "propagation-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_limit)
        _n += 1
      end
      if propagation_phase
        (_names.to_unsafe + _n).value = "propagation-phase".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_phase)
        _n += 1
      end
      if widget
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EventController.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_event_controller_get_type
    end

    def current_event : Gdk::Event?
      # gtk_event_controller_get_current_event: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_event_controller_get_current_event(self)
      Gdk::Event.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def current_event_device : Gdk::Device?
      # gtk_event_controller_get_current_event_device: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_event_controller_get_current_event_device(self)
      Gdk::Device.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def current_event_state : Gdk::ModifierType
      # gtk_event_controller_get_current_event_state: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_event_controller_get_current_event_state(self)
      Gdk::ModifierType.from_value(_retval)
    end

    def current_event_time : UInt32
      # gtk_event_controller_get_current_event_time: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_event_controller_get_current_event_time(self)
      _retval
    end

    def name : ::String
      # gtk_event_controller_get_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_event_controller_get_name(self)
      ::String.new(_retval)
    end

    def propagation_limit : Gtk::PropagationLimit
      # gtk_event_controller_get_propagation_limit: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_event_controller_get_propagation_limit(self)
      Gtk::PropagationLimit.from_value(_retval)
    end

    def propagation_phase : Gtk::PropagationPhase
      # gtk_event_controller_get_propagation_phase: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_event_controller_get_propagation_phase(self)
      Gtk::PropagationPhase.from_value(_retval)
    end

    def widget : Gtk::Widget
      # gtk_event_controller_get_widget: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_event_controller_get_widget(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    def reset : Nil
      # gtk_event_controller_reset: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_event_controller_reset(self)
    end

    def name=(name : ::String) : Nil
      # gtk_event_controller_set_name: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_event_controller_set_name(self, name)
    end

    def propagation_limit=(limit : Gtk::PropagationLimit) : Nil
      # gtk_event_controller_set_propagation_limit: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_event_controller_set_propagation_limit(self, limit)
    end

    def propagation_phase=(phase : Gtk::PropagationPhase) : Nil
      # gtk_event_controller_set_propagation_phase: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_event_controller_set_propagation_phase(self, phase)
    end
  end
end