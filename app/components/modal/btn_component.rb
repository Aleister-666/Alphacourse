# frozen_string_literal: true

class Modal::BtnComponent < ViewComponent::Base

  # Inicializa el boton disparador del modal
  # @param title [String] Title del Boton
  # @param style [String] Estilos del Boton
  # @param extra_data [Hash] Extra Data Values
  def initialize(id: '', title:, style:, extra_data: {})
    @id = id
    @title = title
    @style = style

    @data = { action: 'click->modal#open', 'modal-target': 'handle' }

    unless extra_data.empty?
      if extra_data.include?(:action) && !extra_data[:action].empty?
        @data[:action] += " #{extra_data[:action]}"
        extra_data.delete(:action)
      end
      
      @data.merge!(extra_data)

    end

  end

end
