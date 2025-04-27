#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_copy_rc_cu_z(const double *din, double *zout, const int n) {
    // Calculate global thread ID using 1D block and grid
    int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    if (igpt < n) {
        // Copy input to output and initialize the imaginary part to zero
        zout[2 * igpt] = din[igpt];
        zout[2 * igpt + 1] = 0.0;
    }
}