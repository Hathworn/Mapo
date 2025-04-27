#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_gather_cu_z(double *pwcc, const double *c, const double scale, const int ngpts, const int *ghatmap) {
    // Calculate global thread index
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    if (igpt < ngpts) {
        // Memory coalescing with reduced index recomputation 
        const int map_idx = 2 * ghatmap[igpt];
        const int out_idx = 2 * igpt;
        pwcc[out_idx] = scale * c[map_idx];
        pwcc[out_idx + 1] = scale * c[map_idx + 1];
    }
}