#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pw_gather_cu_z(double *pwcc, const double *c, const double scale, const int ngpts, const int *ghatmap) {

    // Calculate global thread index
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within bounds
    if (igpt < ngpts) {
        int mapIndex = 2 * ghatmap[igpt]; // Use shared memory or register for efficient access
        pwcc[2 * igpt] = scale * c[mapIndex];
        pwcc[2 * igpt + 1] = scale * c[mapIndex + 1];
    }
}