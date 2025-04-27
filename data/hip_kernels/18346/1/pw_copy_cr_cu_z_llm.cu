#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pw_copy_cr_cu_z(const double *zin, double *dout, const int n) {
    // Calculate global thread ID using a 1-D grid configuration
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if this thread should perform a copy
    if (igpt < n) {
        dout[igpt] = zin[2 * igpt]; // Perform the copy
    }
}