require "./widget"
require "./accessible"

require "./app_chooser"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkAppChooserWidget` is a widget for selecting applications.
  #
  # It is the main building block for [class@Gtk.AppChooserDialog].
  # Most applications only need to use the latter; but you can use
  # this widget as part of a larger widget if you have special needs.
  #
  # `GtkAppChooserWidget` offers detailed control over what applications
  # are shown, using the
  # [property@Gtk.AppChooserWidget:show-default],
  # [property@Gtk.AppChooserWidget:show-recommended],
  # [property@Gtk.AppChooserWidget:show-fallback],
  # [property@Gtk.AppChooserWidget:show-other] and
  # [property@Gtk.AppChooserWidget:show-all] properties. See the
  # [iface@Gtk.AppChooser] documentation for more information about these
  # groups of applications.
  #
  # To keep track of the selected application, use the
  # [signal@Gtk.AppChooserWidget::application-selected] and
  # [signal@Gtk.AppChooserWidget::application-activated] signals.
  #
  # # CSS nodes
  #
  # `GtkAppChooserWidget` has a single CSS node with name appchooser.
  class AppChooserWidget < Widget
    include Accessible
    include AppChooser
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, content_type : ::String? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, default_text : ::String? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_all : Bool? = nil, show_default : Bool? = nil, show_fallback : Bool? = nil, show_other : Bool? = nil, show_recommended : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[42]
      _values = StaticArray(LibGObject::Value, 42).new(LibGObject::Value.new)
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
      if content_type
        (_names.to_unsafe + _n).value = "content-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, content_type)
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
      if default_text
        (_names.to_unsafe + _n).value = "default-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_text)
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
      if show_all
        (_names.to_unsafe + _n).value = "show-all".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_all)
        _n += 1
      end
      if show_default
        (_names.to_unsafe + _n).value = "show-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_default)
        _n += 1
      end
      if show_fallback
        (_names.to_unsafe + _n).value = "show-fallback".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_fallback)
        _n += 1
      end
      if show_other
        (_names.to_unsafe + _n).value = "show-other".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_other)
        _n += 1
      end
      if show_recommended
        (_names.to_unsafe + _n).value = "show-recommended".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_recommended)
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

      @pointer = LibGObject.g_object_new_with_properties(AppChooserWidget.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_app_chooser_widget_get_type
    end

    def initialize(content_type : ::String)
      # gtk_app_chooser_widget_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_app_chooser_widget_new(content_type)
      @pointer = _retval
    end

    def default_text : ::String?
      # gtk_app_chooser_widget_get_default_text: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_app_chooser_widget_get_default_text(self)
      ::String.new(_retval) unless _retval.null?
    end

    def show_all? : Bool
      # gtk_app_chooser_widget_get_show_all: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_app_chooser_widget_get_show_all(self)
      GICrystal.to_bool(_retval)
    end

    def show_default? : Bool
      # gtk_app_chooser_widget_get_show_default: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_app_chooser_widget_get_show_default(self)
      GICrystal.to_bool(_retval)
    end

    def show_fallback? : Bool
      # gtk_app_chooser_widget_get_show_fallback: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_app_chooser_widget_get_show_fallback(self)
      GICrystal.to_bool(_retval)
    end

    def show_other? : Bool
      # gtk_app_chooser_widget_get_show_other: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_app_chooser_widget_get_show_other(self)
      GICrystal.to_bool(_retval)
    end

    def show_recommended? : Bool
      # gtk_app_chooser_widget_get_show_recommended: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_app_chooser_widget_get_show_recommended(self)
      GICrystal.to_bool(_retval)
    end

    def default_text=(text : ::String) : Nil
      # gtk_app_chooser_widget_set_default_text: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_app_chooser_widget_set_default_text(self, text)
    end

    def show_all=(setting : Bool) : Nil
      # gtk_app_chooser_widget_set_show_all: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_app_chooser_widget_set_show_all(self, setting)
    end

    def show_default=(setting : Bool) : Nil
      # gtk_app_chooser_widget_set_show_default: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_app_chooser_widget_set_show_default(self, setting)
    end

    def show_fallback=(setting : Bool) : Nil
      # gtk_app_chooser_widget_set_show_fallback: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_app_chooser_widget_set_show_fallback(self, setting)
    end

    def show_other=(setting : Bool) : Nil
      # gtk_app_chooser_widget_set_show_other: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_app_chooser_widget_set_show_other(self, setting)
    end

    def show_recommended=(setting : Bool) : Nil
      # gtk_app_chooser_widget_set_show_recommended: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_app_chooser_widget_set_show_recommended(self, setting)
    end

    struct ApplicationActivatedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "application-activated::#{@detail}" : "application-activated"
      end

      def connect(&block : Proc(Gio::AppInfo, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::AppInfo, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::AppInfo, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::AppInfo__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::AppInfo, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::AppInfo, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::AppInfo__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::AppInfo, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::AppChooserWidget, Gio::AppInfo, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::AppChooserWidget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::AppInfo__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::AppChooserWidget, Gio::AppInfo, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::AppChooserWidget, Gio::AppInfo, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::AppChooserWidget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::AppInfo__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::AppChooserWidget, Gio::AppInfo, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(application : Gio::AppInfo) : Nil
        LibGObject.g_signal_emit_by_name(@source, "application-activated", application)
      end
    end

    def application_activated_signal
      ApplicationActivatedSignal.new(self)
    end

    struct ApplicationSelectedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "application-selected::#{@detail}" : "application-selected"
      end

      def connect(&block : Proc(Gio::AppInfo, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::AppInfo, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::AppInfo, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::AppInfo__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::AppInfo, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::AppInfo, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::AppInfo__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::AppInfo, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::AppChooserWidget, Gio::AppInfo, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::AppChooserWidget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::AppInfo__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::AppChooserWidget, Gio::AppInfo, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::AppChooserWidget, Gio::AppInfo, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::AppChooserWidget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::AppInfo__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::AppChooserWidget, Gio::AppInfo, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(application : Gio::AppInfo) : Nil
        LibGObject.g_signal_emit_by_name(@source, "application-selected", application)
      end
    end

    def application_selected_signal
      ApplicationSelectedSignal.new(self)
    end
  end
end