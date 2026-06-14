-- ==============================================================================
-- Script Name: 01_spatial_filter_roads.sql
-- Description: Dynamically filters and spatial-clips an enterprise road network
--              to generate the target inputs for proximity/distance modeling.
-- ==============================================================================

-- Create a spatial view that ArcPy will read as "Roads2_Clip1"
CREATE OR REPLACE VIEW Roads2_Clip1 AS
SELECT 
    r.objectid,
    r.road_class,
    r.surface_type,
    r.shape -- The native geometry column (e.g., ST_Geometry or PostGIS Geometry)
FROM 
    enterprise_sde.transportation_roads_raw r,
    enterprise_sde.study_area_boundary b
WHERE 
    -- 1. Attribute Filter: Exclude planned/abandoned roads, only use active ones
    r.status = 'Open'
    AND r.road_class IN ('Primary', 'Secondary', 'Local')
    
    -- 2. Spatial Data Cleaning: Ensure valid geometry
    AND r.shape IS NOT NULL
    AND ST_IsValid(r.shape) = 1

    -- 3. Dynamic "Clip": Only select roads that intersect our specific study boundary
    AND b.project_id = 'PROJECT_001'
    AND ST_Intersects(r.shape, b.shape) = 1;

-- Optional: Verify the count of road segments ready for processing
SELECT COUNT(*) as active_road_segments FROM Roads2_Clip1;
