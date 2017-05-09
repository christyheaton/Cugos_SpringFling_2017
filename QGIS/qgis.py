#Open qgis
#Open farmers_markets and routes
#make sure farmers_markets is selected
#open this script in qgis and run
import os
from qgis.utils import iface
from qgis.analysis import QgsGeometryAnalyzer
mc = iface.mapCanvas()
layer = mc.currentLayer()

myfilepath= os.path.dirname( unicode( qgis.utils.iface.activeLayer().dataProvider().dataSourceUri() ) ) ;
QgsGeometryAnalyzer().buffer(layer, myfilepath+'/Output/output.shp', 500, False, False, -1)


layer = iface.addVectorLayer(myfilepath+'/Output/output.shp', "buffer", "ogr")
if not layer:
  print "Layer failed to load!"
