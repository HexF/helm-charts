import sys
import os

os.chdir(os.path.abspath(os.path.dirname(__file__)))

sys.path.append("../.templates/")

from render import RenderTemplate

x = RenderTemplate("firefly-iii")

x.addResource("export", "pvc")
x.addResource("upload", "pvc")
x.addResource("default", "serviceaccount")

x.renderAndWrite(".")