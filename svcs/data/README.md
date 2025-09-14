# Soundscape Data Services

This repository contains the data ingestion and tile server services for Soundscape, providing geospatial data processing and API endpoints for accessible navigation applications.

## Overview

These services use **IMPOSM3** ([imposm3](https://github.com/omniscale/imposm3)) to import OpenStreetMap (OSM) data into PostGIS. IMPOSM's mapping facility performs light filtering on OSM data before injecting it into the database.

> **Note:** While questions have been raised about IMPOSM's maintenance level, we have explored alternatives like OSM2PGSQL with `--output=flex` and appropriate LUA styles, which can produce similar results.

## Architecture

The system consists of three main components:

1. **PostGIS Database**: Stores processed OSM data
2. **Ingest Service**: Downloads and processes OSM data from various sources
3. **Tile Server**: Serves GeoJSON tiles via HTTP API

## Quick Start

### Default Setup (Washington DC)

```bash
docker-compose up --build
```

### Custom Region

```bash
GEN_REGIONS=andorra docker-compose up --build
```

### Available Regions

See `extracts.json` for all available regions including:

- `district-of-columbia` (default)
- `california`
- `toronto`
- `england`
- `andorra`
- And many more...

## Testing the Service

Once all services are running, test by fetching a tile:

```bash
curl http://localhost:8081/16/18745/25070.json
```

Use [bboxfinder.com](http://bboxfinder.com/) to find tile coordinates for your region.

## Adding New Regions

### 1. Find OSM Data Source

Visit [Geofabrik Downloads](https://download.geofabrik.de/) and locate the `.osm.pbf` file for your desired region.

### 2. Get Bounding Box Coordinates

Query OpenStreetMap's Nominatim API to get accurate bounding box:

```bash
curl -s "https://nominatim.openstreetmap.org/search?q=YourRegion&format=json&limit=1&extratags=1" | python3 -m json.tool
```

### 3. Add to extracts.json

Add a new entry to `extracts.json`:

```json
{
    "name": "your-region",
    "url": "https://download.geofabrik.de/path/to/your-region-latest.osm.pbf",
    "bbox": [lat_min, lon_min, lat_max, lon_max]
}
```

### 4. Deploy

```bash
GEN_REGIONS=your-region docker-compose up --build
```

## Environment Variables

| Variable      | Default                | Description                          |
| ------------- | ---------------------- | ------------------------------------ |
| `GEN_REGIONS` | `district-of-columbia` | Region to process from extracts.json |
| `LOOP_TIME`   | `14400`                | Update interval in seconds (4 hours) |
| `NAMESPACE`   | `soundscape`           | Application namespace                |

## Blue-Green Deployment

The system supports zero-downtime updates using blue-green deployment:

1. Update green service: `docker compose up --build -d tilesrv-green`
2. Test on port 8082: `http://localhost:8082`
3. Switch Caddy config and reload
4. Remove blue service: `docker compose stop tilesrv-blue`

## Data Sources

### Primary: OpenStreetMap Data

- Downloads `.osm.pbf` files from Geofabrik and other sources
- Processes streets, POIs, buildings, and other geographic features
- Updates can be scheduled for automatic refresh

### Secondary: Custom Non-OSM Data

- CSV files in `non_osm_data/` directory
- Format: `feature_type,feature_value,longitude,latitude,name`
- Assigned unique IDs (>10^17) to avoid OSM conflicts

## API Endpoints

- **Tiles**: `http://localhost:8081/{z}/{x}/{y}.json`
- **Metrics** (optional): `http://localhost:8083/` (Prometheus format)

## Monitoring

The ingest service provides Prometheus metrics for monitoring:

- Event duration tracking
- Last event timestamps
- Database connection status
