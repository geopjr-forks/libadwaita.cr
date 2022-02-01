module Gio
  # Structure used for scatter/gather data input.
  # You generally pass in an array of #GInputVectors
  # and the operation will store the read data starting in the
  # first buffer, switching to the next as needed.
  class InputVector
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::InputVector))
      @pointer.copy_from(pointer, sizeof(LibGio::InputVector))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(buffer : Pointer(Void)? = nil, size : UInt64? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.buffer = buffer unless buffer.nil?
      _instance.size = size unless size.nil?
      _instance
    end

    def finalize
    end

    def buffer : Pointer(Void)
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      _var.value
    end

    def buffer=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value
      value
    end

    def size : UInt64
      # Property getter
      _var = (@pointer + 8).as(Pointer(UInt64))
      _var.value
    end

    def size=(value : UInt64)
      # Property setter
      _var = (@pointer + 8).as(Pointer(UInt64)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
