#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pw_copy_rc_cu_z(const double *din, double *zout, const int n) {
    // Calculate global index
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop to process all elements
    for (int idx = igpt; idx < n; idx += gridDim.x * blockDim.x) {
        zout[2 * idx] = din[idx];
        zout[2 * idx + 1] = 0.0e0;
    }
}