import simplekml
import numpy as np

# Parameters for your spirograph
R = 6/10000
r = 1/10000
a = 8/10000
nRev = 16

# Central coordinates
latitude = 34.02057
longitude = -118.28544

# Create KML document
kml = simplekml.Kml()

coords = []

# Spirograph calculations
for t in np.arange(0, nRev * np.pi, 0.001):
    x = (R + r) * np.cos((r / R) * t) - a * np.cos((1 + r / R) * t) + longitude
    y = (R + r) * np.sin((r / R) * t) - a * np.sin((1 + r / R) * t) + latitude
    coords.append((x, y))

# Create LineString using the coordinates
ls = kml.newlinestring(name="Spirograph", coords=coords)

# Line style for the spirograph
ls.style.linestyle.color = simplekml.Color.red  # Red color
ls.style.linestyle.width = 5  # 5 pixels

# Save to KML file
kml.save("spirograph.kml")