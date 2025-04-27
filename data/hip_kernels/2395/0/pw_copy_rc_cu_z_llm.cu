```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_copy_rc_cu_z(const double *din, double *zout, const int n) {
    // Calculate unique index of the thread
    int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Check if the thread is within bounds and update zout
    if (igpt < n) {
        zout[igpt * 2] = din[igpt];
        zout[igpt * 2 + 1] = 0.0;
    }
}