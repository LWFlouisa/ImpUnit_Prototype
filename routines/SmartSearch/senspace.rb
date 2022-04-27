# Core parsing library
require "parslet"

require_relative "_parsers/searcher.rb"

# SmartSearch
def searchParser;      SmartSearch::SearchParser;              end
def searchTransform;   SmartSearch::SearchTransform;           end
def searchQuery;       SmartSearch::SearchQuery.convert_query; end
def searchFileType;    SmartSearch::SearchQuery.is_present?;   end
def searchInterpreter; SmartSearch::ReadFile.interpreter;      end
def searchMultisearch; SmartSearch::ReadFile.multisearch;      end