require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkOverlay` is a container which contains a single main child, on top
  # of which it can place “overlay” widgets.
  #
  # ![An example GtkOverlay](overlay.png)
  #
  # The position of each overlay widget is determined by its
  # [property@Gtk.Widget:halign] and [property@Gtk.Widget:valign]
  # properties. E.g. a widget with both alignments set to %GTK_ALIGN_START
  # will be placed at the top left corner of the `GtkOverlay` container,
  # whereas an overlay with halign set to %GTK_ALIGN_CENTER and valign set
  # to %GTK_ALIGN_END will be placed a the bottom edge of the `GtkOverlay`,
  # horizontally centered. The position can be adjusted by setting the margin
  # properties of the child to non-zero values.
  #
  # More complicated placement of overlays is possible by connecting
  # to the [signal@Gtk.Overlay::get-child-position] signal.
  #
  # An overlay’s minimum and natural sizes are those of its main child.
  # The sizes of overlay children are not considered when measuring these
  # preferred sizes.
  #
  # # GtkOverlay as GtkBuildable
  #
  # The `GtkOverlay` implementation of the `GtkBuildable` interface
  # supports placing a child as an overlay by specifying “overlay” as
  # the “type” attribute of a `<child>` element.
  #
  # # CSS nodes
  #
  # `GtkOverlay` has a single CSS node with the name “overlay”. Overlay children
  # whose alignments cause them to be positioned at an edge get the style classes
  # “.left”, “.right”, “.top”, and/or “.bottom” according to their position.
  class Overlay < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[36]
      _values = StaticArray(LibGObject::Value, 36).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if can_focus
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if can_target
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if child
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if css_classes
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if css_name
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if cursor
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if focus_on_click
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if focusable
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if halign
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if has_default
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if has_focus
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if has_tooltip
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if height_request
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if hexpand
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if hexpand_set
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if margin_bottom
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if margin_end
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if margin_start
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if margin_top
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if opacity
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if overflow
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if parent
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if receives_default
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if root
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if scale_factor
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if tooltip_markup
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if tooltip_text
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if valign
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if vexpand
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if vexpand_set
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Overlay.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_overlay_get_type
    end

    def initialize
      # gtk_overlay_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_overlay_new
      @pointer = _retval
    end

    def add_overlay(widget : Gtk::Widget) : Nil
      # gtk_overlay_add_overlay: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_overlay_add_overlay(self, widget)
    end

    def child : Gtk::Widget?
      # gtk_overlay_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_overlay_get_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def clip_overlay(widget : Gtk::Widget) : Bool
      # gtk_overlay_get_clip_overlay: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_overlay_get_clip_overlay(self, widget)
      GICrystal.to_bool(_retval)
    end

    def measure_overlay(widget : Gtk::Widget) : Bool
      # gtk_overlay_get_measure_overlay: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_overlay_get_measure_overlay(self, widget)
      GICrystal.to_bool(_retval)
    end

    def remove_overlay(widget : Gtk::Widget) : Nil
      # gtk_overlay_remove_overlay: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_overlay_remove_overlay(self, widget)
    end

    def child=(child : Gtk::Widget?) : Nil
      # gtk_overlay_set_child: (Method)
      # @child: (nullable)
      # Returns: (transfer none)

      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      LibGtk.gtk_overlay_set_child(self, child)
    end

    def set_clip_overlay(widget : Gtk::Widget, clip_overlay : Bool) : Nil
      # gtk_overlay_set_clip_overlay: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_overlay_set_clip_overlay(self, widget, clip_overlay)
    end

    def set_measure_overlay(widget : Gtk::Widget, measure : Bool) : Nil
      # gtk_overlay_set_measure_overlay: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_overlay_set_measure_overlay(self, widget, measure)
    end

    struct GetChildPositionSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "get-child-position::#{@detail}" : "get-child-position"
      end

      def connect(&block : Proc(Gtk::Widget, Gdk::Rectangle, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::Widget, Gdk::Rectangle, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::Widget, Gdk::Rectangle, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gdk::Rectangle.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Gdk::Rectangle, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Gdk::Rectangle, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gdk::Rectangle.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Gdk::Rectangle, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Overlay, Gtk::Widget, Gdk::Rectangle, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Overlay.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gdk::Rectangle.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Overlay, Gtk::Widget, Gdk::Rectangle, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Overlay, Gtk::Widget, Gdk::Rectangle, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Overlay.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gdk::Rectangle.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Overlay, Gtk::Widget, Gdk::Rectangle, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(widget : Gtk::Widget, allocation : Gdk::Rectangle) : Nil
        LibGObject.g_signal_emit_by_name(@source, "get-child-position", widget, allocation)
      end
    end

    def get_child_position_signal
      GetChildPositionSignal.new(self)
    end
  end
end