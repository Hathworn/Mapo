#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_gather_cu_z(double *pwcc, const double *c, const double scale, const int ngpts, const int *ghatmap) {

    const int igpt = blockIdx.x * blockDim.x + threadIdx.x;

    if (igpt < ngpts) {
        int map_idx = ghatmap[igpt];
        double scale_val = scale;

        // Avoid redundant memory access by storing values in registers
        double real_part = scale_val * c[2 * map_idx];
        double imag_part = scale_val * c[2 * map_idx + 1];

        // Write results to the output
        pwcc[2 * igpt] = real_part;
        pwcc[2 * igpt + 1] = imag_part;
    }
}
```
