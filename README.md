# Euclidean-Analysis
Euclidean Distance shows your ability to model proximity (e.g., calculating how far every piece of land is from the nearest road)

# GIS Automation: Euclidean Distance Analysis using ArcPy

This repository contains a reusable Python script that automates the calculation of a **Euclidean Distance** surface raster (proximity modeling) from vector line features (e.g., road networks and any point feature datasets) using the ArcGIS `arcpy` site package. 

Automating this process removes the manual overhead of the ArcMap/ArcGIS Pro GUI, enabling batch processing, reproducibility, and efficient proximity analysis across enterprise spatial datasets.

## 🛠️ Tool Configuration
The script utilizes the `EucDistance_sa` geoprocessing tool with the following specific configurations:
* **Maximum Distance:** `200` (Calculations are constrained to this threshold to save processing power and memory)
* **Cell Size:** `4.73596089616185` (Derived for precise local-scale resolution)
* **Distance Method:** `PLANAR` (Optimized for projected coordinate systems)
* **Output Direction:** Ignored (Not required for this specific proximity analysis)

## 🚀 How to Use
1. Clone this repository to your local machine.
2. Ensure you have an active **ArcGIS Spatial Analyst** extension license.
3. Open the script and modify the `INPUT_LAYER` and `OUTPUT_RASTER` variables in the `__main__` block to match your local data workspace.
4. Run the script via your ArcGIS Python environment:
   ```bash
   python euclidean_distance_tool.py
