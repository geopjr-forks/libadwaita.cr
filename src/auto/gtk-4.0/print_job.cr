require "../g_object-2.0/object"

module Gtk
  # A `GtkPrintJob` object represents a job that is sent to a printer.
  #
  # You only need to deal directly with print jobs if you use the
  # non-portable [class@Gtk.PrintUnixDialog] API.
  #
  # Use [method@Gtk.PrintJob.get_surface] to obtain the cairo surface
  # onto which the pages must be drawn. Use [method@Gtk.PrintJob.send]
  # to send the finished job to the printer. If you don’t use cairo
  # `GtkPrintJob` also supports printing of manually generated PostScript,
  # via [method@Gtk.PrintJob.set_source_file].
  class PrintJob < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, page_setup : Gtk::PageSetup? = nil, printer : Gtk::Printer? = nil, settings : Gtk::PrintSettings? = nil, title : ::String? = nil, track_print_status : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if page_setup
        (_names.to_unsafe + _n).value = "page-setup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, page_setup)
        _n += 1
      end
      if printer
        (_names.to_unsafe + _n).value = "printer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, printer)
        _n += 1
      end
      if settings
        (_names.to_unsafe + _n).value = "settings".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, settings)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if track_print_status
        (_names.to_unsafe + _n).value = "track-print-status".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, track_print_status)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(PrintJob.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_print_job_get_type
    end

    def page_setup=(value : PageSetup?) : PageSetup?
      unsafe_value = value

      LibGObject.g_object_set(self, "page-setup", unsafe_value, Pointer(Void).null)
      value
    end

    def printer=(value : Printer?) : Printer?
      unsafe_value = value

      LibGObject.g_object_set(self, "printer", unsafe_value, Pointer(Void).null)
      value
    end

    def settings=(value : PrintSettings?) : PrintSettings?
      unsafe_value = value

      LibGObject.g_object_set(self, "settings", unsafe_value, Pointer(Void).null)
      value
    end

    def title=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "title", unsafe_value, Pointer(Void).null)
      value
    end

    def initialize(title : ::String, printer : Gtk::Printer, settings : Gtk::PrintSettings, page_setup : Gtk::PageSetup)
      # gtk_print_job_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_print_job_new(title, printer, settings, page_setup)
      @pointer = _retval
    end

    def collate? : Bool
      # gtk_print_job_get_collate: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_collate(self)
      GICrystal.to_bool(_retval)
    end

    def n_up : UInt32
      # gtk_print_job_get_n_up: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_n_up(self)
      _retval
    end

    def n_up_layout : Gtk::NumberUpLayout
      # gtk_print_job_get_n_up_layout: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_n_up_layout(self)
      Gtk::NumberUpLayout.from_value(_retval)
    end

    def num_copies : Int32
      # gtk_print_job_get_num_copies: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_num_copies(self)
      _retval
    end

    def page_ranges(n_ranges : Int32) : Enumerable(Gtk::PageRange)
      # gtk_print_job_get_page_ranges: (Method)
      # @n_ranges: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_page_ranges(self, n_ranges)
      _retval
    end

    def page_set : Gtk::PageSet
      # gtk_print_job_get_page_set: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_page_set(self)
      Gtk::PageSet.from_value(_retval)
    end

    def pages : Gtk::PrintPages
      # gtk_print_job_get_pages: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_pages(self)
      Gtk::PrintPages.from_value(_retval)
    end

    def printer : Gtk::Printer
      # gtk_print_job_get_printer: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_printer(self)
      Gtk::Printer.new(_retval, GICrystal::Transfer::None)
    end

    def reverse? : Bool
      # gtk_print_job_get_reverse: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_reverse(self)
      GICrystal.to_bool(_retval)
    end

    def rotate? : Bool
      # gtk_print_job_get_rotate: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_rotate(self)
      GICrystal.to_bool(_retval)
    end

    def scale : Float64
      # gtk_print_job_get_scale: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_scale(self)
      _retval
    end

    def settings : Gtk::PrintSettings
      # gtk_print_job_get_settings: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_settings(self)
      Gtk::PrintSettings.new(_retval, GICrystal::Transfer::None)
    end

    def status : Gtk::PrintStatus
      # gtk_print_job_get_status: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_status(self)
      Gtk::PrintStatus.from_value(_retval)
    end

    def surface : Cairo::Surface
      # gtk_print_job_get_surface: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_surface(self)
      Cairo::Surface.new(_retval, GICrystal::Transfer::None)
    end

    def title : ::String
      # gtk_print_job_get_title: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_title(self)
      ::String.new(_retval)
    end

    def track_print_status? : Bool
      # gtk_print_job_get_track_print_status: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_get_track_print_status(self)
      GICrystal.to_bool(_retval)
    end

    def send(callback : Pointer(Void), user_data : Pointer(Nil)?, dnotify : Pointer(Void)) : Nil
      # gtk_print_job_send: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGtk.gtk_print_job_send(self, callback, user_data, dnotify)
    end

    def collate=(collate : Bool) : Nil
      # gtk_print_job_set_collate: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_job_set_collate(self, collate)
    end

    def n_up=(n_up : UInt32) : Nil
      # gtk_print_job_set_n_up: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_job_set_n_up(self, n_up)
    end

    def n_up_layout=(layout : Gtk::NumberUpLayout) : Nil
      # gtk_print_job_set_n_up_layout: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_job_set_n_up_layout(self, layout)
    end

    def num_copies=(num_copies : Int32) : Nil
      # gtk_print_job_set_num_copies: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_job_set_num_copies(self, num_copies)
    end

    def set_page_ranges(ranges : Enumerable(Gtk::PageRange)) : Nil
      # gtk_print_job_set_page_ranges: (Method)
      # @ranges: (transfer full) (array length=n_ranges element-type Interface)
      # Returns: (transfer none)

      n_ranges = ranges.size
      ranges = ranges.to_a.map(&.to_unsafe).to_unsafe

      LibGtk.gtk_print_job_set_page_ranges(self, ranges, n_ranges)
    end

    def set_page_ranges(*ranges : Gtk::PageRange)
      set_page_ranges(ranges)
    end

    def page_set=(page_set : Gtk::PageSet) : Nil
      # gtk_print_job_set_page_set: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_job_set_page_set(self, page_set)
    end

    def pages=(pages : Gtk::PrintPages) : Nil
      # gtk_print_job_set_pages: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_job_set_pages(self, pages)
    end

    def reverse=(reverse : Bool) : Nil
      # gtk_print_job_set_reverse: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_job_set_reverse(self, reverse)
    end

    def rotate=(rotate : Bool) : Nil
      # gtk_print_job_set_rotate: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_job_set_rotate(self, rotate)
    end

    def scale=(scale : Float64) : Nil
      # gtk_print_job_set_scale: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_job_set_scale(self, scale)
    end

    def source_fd=(fd : Int32) : Bool
      # gtk_print_job_set_source_fd: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_set_source_fd(self, fd)
      GICrystal.to_bool(_retval)
    end

    def source_file=(filename : ::String) : Bool
      # gtk_print_job_set_source_file: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_job_set_source_file(self, filename)
      GICrystal.to_bool(_retval)
    end

    def track_print_status=(track_status : Bool) : Nil
      # gtk_print_job_set_track_print_status: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_job_set_track_print_status(self, track_status)
    end

    struct StatusChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "status-changed::#{@detail}" : "status-changed"
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

      def connect(block : Proc(Gtk::PrintJob, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintJob.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintJob, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintJob, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintJob.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintJob, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "status-changed")
      end
    end

    def status_changed_signal
      StatusChangedSignal.new(self)
    end
  end
end