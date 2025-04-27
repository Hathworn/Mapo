#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_gather_cu_z(double *pwcc, const double *c, const double scale, const int ngpts, const int *ghatmap) {
    const int igpt = 
    (gridDim.x * blockIdx.y + blockIdx.x) * blockDim.x + threadIdx.x;

    // Optimize by adjusting the condition to eliminate unnecessary operations
    if (igpt >= ngpts) return;
    
    // Optimize memory access pattern for coalescing
    int index = 2 * ghatmap[igpt];
    pwcc[2 * igpt] = scale * c[index];
    pwcc[2 * igpt + 1] = scale * c[index + 1];
}