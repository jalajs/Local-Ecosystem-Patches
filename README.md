# Local-Ecosystem-Patches
SQL database/application containing data on local ecosystems with a command line interface. Includes data such as location, dominant species, legal status, habitat type, foundational and keystone species

Project Architecture
* SQL storage
  * MySQL RDBMS
* Python framework 
  * PyMySQL to connect to MySQL server from Python
* Terminal program front end



User Functionality
* Users of our program can perform all CRUD operations on the database
  * Create, read, update, delete records for subregions/ecosystems they visit
  * Create, read, update, delete records for species they encounter in these particular regions and ecosystems
* Our application is primarily intended for ecologists (of all levels)
* Ultimately, they will be able to record their own experiences/observations with local ecosystems and analyze the relationships among ecosystems and species 
