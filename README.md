# cotiza.sh-BCU
Script para descargar cotizacion del dolar del WS del Banco Central del Uruguay y pasarlo a un CSV solo en sh
Basado en la idea de [py_bcu](http://https://github.com/martinmanzo/py_bcu/ "py_bcu") pero haciendolo mas simple, solo requiere **curl** y **awk**.

Se conecta al [WS](https://cotizaciones.bcu.gub.uy/wscotizaciones/servlet/awsbcucotizaciones?wsdl "WS") del BCU con la peticion para saber el valor del dolar del día de anterior (parte de un batch de procesos) y descarga la cotizacion que se tira a un archivo, nada mas.

Mejoras, todas bienvenidas, pero sin hacer uso de herramientas externas.
