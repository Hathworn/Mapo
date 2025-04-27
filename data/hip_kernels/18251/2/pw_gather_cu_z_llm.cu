#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_gather_cu_z(double *pwcc, const double *c, const double scale, const int ngpts, const int *ghatmap) {
    // Calculate global thread index using optimized method
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    if (igpt < ngpts) {
        // Directly calculate the indices to enhance performance
        const int mapIdx = 2 * ghatmap[igpt];
        pwcc[2 * igpt] = scale * c[mapIdx];
        pwcc[2 * igpt + 1] = scale * c[mapIdx + 1];
    }
}