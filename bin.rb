require "fb"
require "csv"

include Fb

db = Database.new(
  :database => "localhost:/firebird/data/MR_CORRETORA.FDB",
  :username => 'SYSDBA',
  :password => 'masterkey'
)

conn = db.connect rescue db.create.connect

CSV.open("export.csv", "wb") do |csv|

    conn.execute("SELECT * FROM USUARIOS") do |users|
        users.each do |row|
            csv << [row[1], row[2]]
        end
    end

end