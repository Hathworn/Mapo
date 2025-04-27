#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pw_gather_cu_z(double *pwcc, const double *c, const double scale, const int ngpts, const int *ghatmap) {
    // Calculate global index
    int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Check for boundary and update pwcc
    if (igpt < ngpts) {
        int idx = 2 * ghatmap[igpt]; // Reduce redundant multiplication
        pwcc[2 * igpt] = scale * c[idx];
        pwcc[2 * igpt + 1] = scale * c[idx + 1];
    }
}