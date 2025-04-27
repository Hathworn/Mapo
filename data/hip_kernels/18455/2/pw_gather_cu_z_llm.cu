#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pw_gather_cu_z(double *pwcc, const double *c, const double scale, const int ngpts, const int *ghatmap) {

    // Calculate global thread index using threadIdx, blockIdx, and blockDim
    int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Ensure that the thread operates only within bounds
    if (igpt < ngpts) {
        int index = 2 * ghatmap[igpt];
        // Optimize memory access pattern 
        pwcc[2 * igpt] = scale * c[index];
        pwcc[2 * igpt + 1] = scale * c[index + 1];
    }
}