#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void pw_copy_cr_cu_z(const double *zin, double *dout, const int n) {
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index computation

    if (igpt < n) {
        dout[igpt] = zin[2 * igpt];
    }
}