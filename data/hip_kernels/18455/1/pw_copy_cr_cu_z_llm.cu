#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_copy_cr_cu_z(const double * __restrict__ zin, double * __restrict__ dout, const int n) {
    // Calculate the global thread index
    int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Ensure not to exceed the array bounds
    if (igpt < n) {
        // Copy every alternate element from zin to dout
        dout[igpt] = zin[2 * igpt];
    }
}