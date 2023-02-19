# frozen_string_literal: true

class Modal::WindowComponent < ViewComponent::Base

  # Inicializa la ventana del Modal, Es necesario un disparador
  # @param header [String] Texto de la cabezera de la ventana del modal
  # @param extra_data [Hash] Extra data values
  def initialize(id: '', header:, extra_data: {})
    @id = id
    @header = header
    @data = { 'modal-target': 'modal' }

    @data.merge!(extra_data) unless extra_data.empty?
  end

end
