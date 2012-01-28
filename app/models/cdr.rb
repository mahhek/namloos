class Cdr < ActiveRecord::Base

  establish_connection :cdr_fetching

  set_table_name "cdr"

end
