module PatternValidation
  PHONE = /\A\S\d{2}\S\s\d{4,5}-\d{4}\z/
  CRM = /\A\d{4,10}\S\D{2}\z/
  CPF = /\A\d{3}.\d{3}.\d{3}-\d{2}\z/
end