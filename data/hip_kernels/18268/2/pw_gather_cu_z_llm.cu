#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_gather_cu_z(double *pwcc, const double *c, const double scale, const int ngpts, const int *ghatmap) {
    // Use a 1D block and grid for better performance on linear access
    int igpt = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize memory access by reducing the number of multiplications
    if (igpt < ngpts) {
        int c_index = 2 * ghatmap[igpt];
        pwcc[2 * igpt] = scale * c[c_index];
        pwcc[2 * igpt + 1] = scale * c[c_index + 1];
    }
}