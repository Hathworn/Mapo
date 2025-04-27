#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_copy_cr_cu_z(const double *zin, double *dout, const int n) {
    // Calculate global thread index
    int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Check if index is within bounds
    if (igpt < n) {
        // Copy data from input to output
        dout[igpt] = zin[2 * igpt];
    }
}
