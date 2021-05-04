#!/bin/bash
# Script para descarga del valor del dolar del día anterior, PoC

HOY=`date --date=yesterday +%F`
URL="https://cotizaciones.bcu.gub.uy/wscotizaciones/servlet/awsbcucotizaciones"
echo "" > cotiza.csv

xmlhead='<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cot="Cotiza">
    <soapenv:Header/>
    <soapenv:Body>
       <cot:wsbcucotizaciones.Execute>
          <cot:Entrada>
             <cot:Moneda>
                 <cot:item>2225</cot:item>
             </cot:Moneda>
             <cot:FechaDesde>'

xmlmid='</cot:FechaDesde>
<cot:FechaHasta>'
xmlfoot='</cot:FechaHasta>
             <cot:Grupo>0</cot:Grupo>
          </cot:Entrada>
       </cot:wsbcucotizaciones.Execute>
    </soapenv:Body>
 </soapenv:Envelope>'

xmldata="${xmlhead}$HOY${xmlmid}$HOY${xmlfoot}"

curl --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction:urn:Cotizaaction/AWSBCUCOTIZACIONES.Execute" --data-binary "$xmldata" $URL > response.xml

FECHA=$(awk -F '[<>]' '/<Fecha>/{print $3}' response.xml)
ISO=$(awk -F '[<>]' '/<CodigoISO>/{print $3}' response.xml)
TCC=$(awk -F '[<>]' '/<TCC>/{print $3}' response.xml)
TCV=$(awk -F '[<>]' '/<TCV>/{print $3}' response.xml)

echo FECHA,CODISO,TCC,TCV > cotiza.csv
echo $FECHA,$ISO,$TCC,$TCV >> cotiza.csv
