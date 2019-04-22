# notre class Gossip représente notre "MODEL" dans MVC. Seul la classe Model est liés à des objets concrets : des potins ou des gossips. Autant lui donner un nom concret.
class Gossip

#nous allons créer plein d'instance et méthode savepour interagir avec un fichier CSV.
attr_accessor :author, :content


	def initialize(author,content)
		@content = content
		@author = author
	end


	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
		 csv << [@author, @content]  	
		end
	end

	
	def self.all
		all_gossips = []
	  
		CSV.read("./db/gossip.csv").each do |csv_lines|
		all_gossips << Gossip.new(csv_lines[0], csv_lines[1]) 
		end 
		return all_gossips
	end

	def self.find(id)
    	all[id]
 	end
	
end

