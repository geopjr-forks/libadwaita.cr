require "./event_controller"

module Gtk
  # `GtkDropControllerMotion` is an event controller tracking
  # the pointer during Drag-and-Drop operations.
  #
  # It is modeled after [class@Gtk.EventControllerMotion] so if you
  # have used that, this should feel really familiar.
  #
  # This controller is not able to accept drops, use [class@Gtk.DropTarget]
  # for that purpose.
  class DropControllerMotion < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, contains_pointer : Bool? = nil, drop : Gdk::Drop? = nil, is_pointer : Bool? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[7]
      _values = StaticArray(LibGObject::Value, 7).new(LibGObject::Value.new)
      _n = 0

      if contains_pointer
        (_names.to_unsafe + _n).value = "contains-pointer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, contains_pointer)
        _n += 1
      end
      if drop
        (_names.to_unsafe + _n).value = "drop".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, drop)
        _n += 1
      end
      if is_pointer
        (_names.to_unsafe + _n).value = "is-pointer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_pointer)
        _n += 1
      end
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

      @pointer = LibGObject.g_object_new_with_properties(DropControllerMotion.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_drop_controller_motion_get_type
    end

    def contains_pointer? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "contains-pointer", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def drop : Gdk::Drop?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "drop", pointerof(value), Pointer(Void).null)
      Gdk::Drop.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def is_pointer? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-pointer", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize
      # gtk_drop_controller_motion_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_drop_controller_motion_new
      @pointer = _retval
    end

    def contains_pointer : Bool
      # gtk_drop_controller_motion_contains_pointer: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_drop_controller_motion_contains_pointer(self)
      GICrystal.to_bool(_retval)
    end

    def drop : Gdk::Drop?
      # gtk_drop_controller_motion_get_drop: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_drop_controller_motion_get_drop(self)
      Gdk::Drop.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def is_pointer : Bool
      # gtk_drop_controller_motion_is_pointer: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_drop_controller_motion_is_pointer(self)
      GICrystal.to_bool(_retval)
    end

    struct EnterSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "enter::#{@detail}" : "enter"
      end

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DropControllerMotion, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropControllerMotion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DropControllerMotion, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropControllerMotion, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropControllerMotion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DropControllerMotion, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "enter", x, y)
      end
    end

    def enter_signal
      EnterSignal.new(self)
    end

    struct LeaveSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "leave::#{@detail}" : "leave"
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

      def connect(block : Proc(Gtk::DropControllerMotion, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DropControllerMotion.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropControllerMotion, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropControllerMotion, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DropControllerMotion.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropControllerMotion, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "leave")
      end
    end

    def leave_signal
      LeaveSignal.new(self)
    end

    struct MotionSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "motion::#{@detail}" : "motion"
      end

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DropControllerMotion, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropControllerMotion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DropControllerMotion, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropControllerMotion, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropControllerMotion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DropControllerMotion, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "motion", x, y)
      end
    end

    def motion_signal
      MotionSignal.new(self)
    end
  end
end
