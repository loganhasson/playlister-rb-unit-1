# the instructions seem to indicate we don't use
# any require or require_relative statements here
require_relative '../config/environment'

LibraryParser.call
PlaylisterCLI.run