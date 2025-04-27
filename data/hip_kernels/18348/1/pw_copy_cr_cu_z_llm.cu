#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_copy_cr_cu_z(const double *zin, double *dout, const int n) {
    // Calculate global thread index
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Bound checking to avoid out-of-bounds access
    if (igpt < n) {
        dout[igpt] = zin[2 * igpt];
    }
}