module Upa::PatientHelper
  OptionsForGenres = Struct.new(:id, :description)

  def options_for_genres
    Patient.genres_i18n.map do |key, value|
      OptionsForGenres.new(key, value)
    end
  end
end
