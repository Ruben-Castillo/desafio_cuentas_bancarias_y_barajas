require_relative'carta'

class Baraja
    attr_reader :cartas
    def initialize
        cartas=[]
        pintas=['C','D','T','P']
        for p in 0..3 do
            for n in 1..13 do
                @cartas=cartas.push(Carta.new(n,pintas[p]))
            end
        end
    end

    def barajar
        @cartas=@cartas.shuffle
    end

    def sacar
        @cartas.pop
    end

    def repartir_mano
        mano=[]
        5.times do
            mano=mano.push(@cartas.pop)
        end
        return mano
    end
end


