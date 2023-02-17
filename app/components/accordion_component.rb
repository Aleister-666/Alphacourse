# frozen_string_literal: true

class AccordionComponent < ViewComponent::Base

  # Inicializacion del componente
  # @param header [String] Titulo de la cabecera del accordion
  # @param collapsed [Boolean|String] Determina si el accordion se renderiza collapsado o no
  # @param active_color [String] Determina el color que toma el header cuando esta activo
  def initialize(header:, collapsed: 'true', active_color: 'text-purple-600')
    @header = header
    @collapsed = collapsed
    @active_color = active_color
  end

end
