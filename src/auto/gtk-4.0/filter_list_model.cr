require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # `GtkFilterListModel` is a list model that filters the elements of
  # the underlying model according to a `GtkFilter`.
  #
  # It hides some elements from the other model according to
  # criteria given by a `GtkFilter`.
  #
  # The model can be set up to do incremental searching, so that
  # filtering long lists doesn't block the UI. See
  # [method@Gtk.FilterListModel.set_incremental] for details.
  class FilterListModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, filter : Gtk::Filter? = nil, incremental : Bool? = nil, model : Gio::ListModel? = nil, pending : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if filter
        (_names.to_unsafe + _n).value = "filter".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, filter)
        _n += 1
      end
      if incremental
        (_names.to_unsafe + _n).value = "incremental".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, incremental)
        _n += 1
      end
      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if pending
        (_names.to_unsafe + _n).value = "pending".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pending)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FilterListModel.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_filter_list_model_get_type
    end

    def filter=(value : Gtk::Filter?) : Gtk::Filter?
      unsafe_value = value

      LibGObject.g_object_set(self, "filter", unsafe_value, Pointer(Void).null)
      value
    end

    def filter : Gtk::Filter?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "filter", pointerof(value), Pointer(Void).null)
      Gtk::Filter.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def incremental=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "incremental", unsafe_value, Pointer(Void).null)
      value
    end

    def incremental? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "incremental", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def model=(value : Gio::ListModel?) : Gio::ListModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "model", unsafe_value, Pointer(Void).null)
      value
    end

    def model : Gio::ListModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "model", pointerof(value), Pointer(Void).null)
      Gio::ListModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def pending : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "pending", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize(model : Gio::ListModel?, filter : Gtk::Filter?)
      # gtk_filter_list_model_new: (Constructor)
      # @model: (transfer full) (nullable)
      # @filter: (transfer full) (nullable)
      # Returns: (transfer full)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      filter = if filter.nil?
                 Pointer(Void).null
               else
                 filter.to_unsafe
               end
      LibGObject.g_object_ref(model)
      LibGObject.g_object_ref(filter)

      _retval = LibGtk.gtk_filter_list_model_new(model, filter)
      @pointer = _retval
    end

    def filter : Gtk::Filter?
      # gtk_filter_list_model_get_filter: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_filter_list_model_get_filter(self)
      Gtk::Filter.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def incremental : Bool
      # gtk_filter_list_model_get_incremental: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_filter_list_model_get_incremental(self)
      GICrystal.to_bool(_retval)
    end

    def model : Gio::ListModel?
      # gtk_filter_list_model_get_model: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_filter_list_model_get_model(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def pending : UInt32
      # gtk_filter_list_model_get_pending: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_filter_list_model_get_pending(self)
      _retval
    end

    def filter=(filter : Gtk::Filter?) : Nil
      # gtk_filter_list_model_set_filter: (Method)
      # @filter: (nullable)
      # Returns: (transfer none)

      filter = if filter.nil?
                 Pointer(Void).null
               else
                 filter.to_unsafe
               end

      LibGtk.gtk_filter_list_model_set_filter(self, filter)
    end

    def incremental=(incremental : Bool) : Nil
      # gtk_filter_list_model_set_incremental: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_filter_list_model_set_incremental(self, incremental)
    end

    def model=(model : Gio::ListModel?) : Nil
      # gtk_filter_list_model_set_model: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_filter_list_model_set_model(self, model)
    end
  end
end
