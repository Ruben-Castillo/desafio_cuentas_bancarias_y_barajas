class CuentaBancaria
    attr_accessor :saldo
    def initialize (nombre_del_banco,numero_de_cuenta, saldo=0)
        @nombre_del_banco=nombre_del_banco
        @numero_de_cuenta=numero_de_cuenta
        @saldo=saldo
    end
    def transferir(monto,cuenta_destino)
        @saldo-=monto
        cuenta_destino.saldo +=monto
    end
end
class Usuario
    def initialize(nombre, cuentas_bancarias)
        raise ArgumentError, "El argumento 'cuentas_bancarias' debe ser de clase array" if cuentas_bancarias.class != Array
        n=cuentas_bancarias.count
        m=n
        cuentas_bancarias.each do |cuenta|
            m-=1 if cuenta.class != CuentaBancaria
        end
        raise ArgumentError,"Todos los valores del array 'cuentas_bancarias' deben ser de clase CuentaBancaria" if m!=n   
        @nombre=nombre
        @cuentas_bancarias=cuentas_bancarias
    end
    def saldo_total
        saldo=@cuentas_bancarias.inject(0){|total,cuenta| total+= cuenta.saldo}
    end
end
