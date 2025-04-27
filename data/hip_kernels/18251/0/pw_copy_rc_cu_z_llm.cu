#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_copy_rc_cu_z(const double *din, double *zout, const int n) {
    // Calculate linear thread id for entire grid
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride to allow one thread to handle multiple elements
    for (int i = igpt; i < n; i += gridDim.x * blockDim.x) {
        zout[2 * i] = din[i];
        zout[2 * i + 1] = 0.0e0;
    }
}