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
- **Database**: `localhost:5432` (PostgreSQL with PostGIS)

## Example: Querying Andorra Data

When you configure the system for Andorra (`GEN_REGIONS=andorra`), you can test the tile server with these verified coordinates and URLs:

### Recommended Test Locations

| Location                       | Latitude  | Longitude | Features | Tile URL                                                         |
| ------------------------------ | --------- | --------- | -------- | ---------------------------------------------------------------- |
| **Andorra la Vella** (Capital) | `42.5063` | `1.5218`  | 737      | [16/33045/24203.json](http://localhost:8081/16/33045/24203.json) |
| **Escaldes-Engordany**         | `42.5067` | `1.5347`  | 312      | [16/33047/24203.json](http://localhost:8081/16/33047/24203.json) |
| **Geographic Center**          | `42.5407` | `1.5732`  | 7        | [16/33054/24195.json](http://localhost:8081/16/33054/24195.json) |

### Sample Data Verification

```bash
# Check total data loaded
docker-compose exec postgis psql -U postgres -d osm -c "SELECT COUNT(*) FROM osm_roads;"
docker-compose exec postgis psql -U postgres -d osm -c "SELECT COUNT(*) FROM osm_places;"

# Test a high-density tile (Andorra la Vella)
curl "http://localhost:8081/16/33045/24203.json" | jq '.features | length'

# View sample places in Andorra
docker-compose exec postgis psql -U postgres -d osm -c "SELECT name, feature_type, feature_value FROM osm_places WHERE name LIKE '%Andorra%' LIMIT 5;"
```

### Database Connection

The PostgreSQL database is exposed on `localhost:5432` for external client connections:

```bash
# Connection parameters
Host: localhost
Port: 5432
Database: osm
Username: postgres
Password: secret
```

Example connection strings:

```bash
# psql command line
psql -h localhost -p 5432 -U postgres -d osm

# Connection URL
postgresql://postgres:secret@localhost:5432/osm
```

### Mobile App Configuration

For mobile applications, use these initial coordinates:

```json
{
  "initialLocation": {
    "latitude": 42.5063,
    "longitude": 1.5218,
    "zoom": 16
  },
  "tileServerUrl": "http://localhost:8081",
  "boundingBox": {
    "north": 42.6559357,
    "south": 42.4288238,
    "east": 1.7868662,
    "west": 1.4077997
  }
}
```

### Expected Data Coverage

- **Roads**: ~7,187 road segments
- **Places**: ~12,134 points of interest
- **Features**: Hotels, restaurants, government buildings, paths, residential streets
- **Languages**: Primarily Catalan, with some French and Spanish names

## Monitoring

The ingest service provides Prometheus metrics for monitoring:

- Event duration tracking
- Last event timestamps
- Database connection status
