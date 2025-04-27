#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_gather_cu_z(double *pwcc, const double *c, const double scale, const int ngpts, const int *ghatmap) {

    // Calculate global thread index for 1D grid
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x + gridDim.x * (blockIdx.y);

    // Check if the thread should perform the calculation
    if (igpt < ngpts) {
        // Perform scaled assignment
        int map_idx = ghatmap[igpt];
        pwcc[2 * igpt] = scale * c[2 * map_idx];
        pwcc[2 * igpt + 1] = scale * c[2 * map_idx + 1];
    }
}