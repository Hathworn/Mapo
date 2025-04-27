#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_copy_rc_cu_z(const double *din, double *zout, const int n) {
    // Use a single calculation for the global thread index
    int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Ensure the thread operates only on valid data
    if (igpt < n) {
        zout[2 * igpt] = din[igpt];
        zout[2 * igpt + 1] = 0.0;
    }
}