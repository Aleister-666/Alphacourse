# frozen_string_literal: true

class SearchFormComponent < ViewComponent::Base

  # Inicializa el componente
  # @param url [String] Url a la cual se hara la peticion
  # @param target [String] Turbo Frame objetivo al cual enviar los resultados
  # @param name [String|Symbol] Nombre del campo por el cual filtrar
  # @param placeholder [String] Placeholder del search field(Opcional)
  def initialize(url:, target:, name:, placeholder: 'Buscar...')
    @url = url
    @target = target
    @name = name
    @placeholder = placeholder
  end

end
