# NodeThermalTools

Run [Thermal Tools](https://github.com/uav4geo/Thermal-Tools) over the internet via a REST API. [PyODM](https://pyodm.readthedocs.io/en/latest/) compatible.

<img width="1165" height="736" alt="image" src="https://github.com/user-attachments/assets/93c7e328-fdcf-4b5e-8e5f-e140775993d3" />


## Usage

```bash
docker run -ti --rm -p 3000:3000 uav4geo/nodethermaltools
```

 * Open a browser to http://localhost:3000
 * Process images

## Licenses

This code, not including the DJI Thermal SDK and Exiftool is licensed under the AGPLv3.

The DJI Thermal SDK binaries are proprietary. See https://www.dji.com/downloads/softwares/dji-thermal-sdk for licensing details.

ExifTool is licensed under the GPLv3