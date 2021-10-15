require "./render_node"

module Gsk
  # A render node repeating its single child node.
  class RepeatNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_repeat_node_get_type
    end

    def initialize(bounds : Graphene::Rect, child : Gsk::RenderNode, child_bounds : Graphene::Rect?)
      # gsk_repeat_node_new: (Constructor)
      # @child_bounds: (nullable)
      # Returns: (transfer full)

      child_bounds = if child_bounds.nil?
                       Pointer(Void).null
                     else
                       child_bounds.to_unsafe
                     end

      _retval = LibGsk.gsk_repeat_node_new(bounds, child, child_bounds)
      @pointer = _retval
    end

    def child : Gsk::RenderNode
      # gsk_repeat_node_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_repeat_node_get_child(self)
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def child_bounds : Graphene::Rect
      # gsk_repeat_node_get_child_bounds: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_repeat_node_get_child_bounds(self)
      Graphene::Rect.new(_retval, GICrystal::Transfer::None)
    end
  end
end