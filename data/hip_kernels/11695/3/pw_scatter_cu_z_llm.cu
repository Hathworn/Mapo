#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pw_scatter_cu_z(double *c, const double *pwcc, const double scale, const int ngpts, const int nmaps, const int *ghatmap) {

    // Calculate the global index for the current thread
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x + (gridDim.x * blockIdx.y);

    // Process only valid indices
    if (igpt < ngpts) {
        // Calculate the index for ghatmap once to avoid redundant calculations
        int map_idx = 2 * ghatmap[igpt];

        // Update the output array with scaling
        c[map_idx] = scale * pwcc[2 * igpt];
        c[map_idx + 1] = scale * pwcc[2 * igpt + 1];

        // Handle additional mapping if required
        if (nmaps == 2) {
            int map_idx_ngpts = 2 * ghatmap[igpt + ngpts];
            c[map_idx_ngpts] = scale * pwcc[2 * igpt];
            c[map_idx_ngpts + 1] = -scale * pwcc[2 * igpt + 1];
        }
    }
}