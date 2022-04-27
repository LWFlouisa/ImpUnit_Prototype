require "parslet"

module Fraponic
  class FraponicParser
    root(:expression)

    rule(:expression) { nonnegated | negated }

    rule(:nonnegated) { gender    + space +
                        noun      + space +
                        adjective + space +
                        article   + space +
                        verb      + space +
                        adverb    + punctuation }

    # Create gender rules for Fraponic.
    rule(:gender) {
      le   | la   | les   |
      anu  | ana  | anos  |
      der  | die  | das   |
      lanu | lana | lanos
    }

    # Individualizes specific gender rules.

    ## French Gender System
    rule(:le)  { str('Le') }
    rule(:la)  { str('La') }
    rule(:les) { str('Les') }

    ## Neo-Japanese Gender System
    rule(:anu)  {  str('Anu') }
    rule(:ana)  {  str('Ana') }
    rule(:anos) { str('Anos') }

    ## German Gender System
    rule(:der) { str('Der') }
    rule(:die) { str('Die') }
    rule(:das) { str('Das') }

    # Creates rules for noun types
    rule(:noun) { person | places | animals | things }

    # Individualizes specific noun rules.
    rule(:person) { manF | womanF | girlF | boyF |
                    manJ | womanJ | girlJ | boyJ |
                    manG | womanG | girlG | boyG 
                  }

    ## person type
    ### Man Type
    rule(:manF) { str('homme') }
    rule(:manJ) { str('otoko') }
    rule(:manG) { str('mann') }

    ### Woman Type
    rule(:womanF) { str('femme') }
    rule(:womanJ) { str('josei') }
    rule(:womanG) {  str('frau') }

    ### Boy Type
    rule(:boyF) {    str('garcon') }
    rule(:boyJ) { str('otokonoko') }
    rule(:boyG) {     str('junge') }

    ### Girl Type
    rule(:girlF) {    str('fille') }
    rule(:girlJ) { str('onnanoko') }
    rule(:girlG) {  str('madchen') }

    # Individualized rules about places
    rule(:places) { northamerica | france | japan }

    ## Specific location rules
    rule(:northamerica) { str('Amerique_Du_Nord') }
    rule(:france)       {           str('France') }
    rule(:japan)        {            str('Nihon') }
  end

  class FraponicTransform < Parslet::Transform
  end

  class FraponicTranspiler
  end

  class FraponicReadInput
  end
end