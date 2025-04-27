#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_copy_rc_cu_z(const double *din, double *zout, const int n) {
    int igpt = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x; // Optimize index calculation

    if (igpt < n) {
        double value = din[igpt]; // Cache input value
        zout[2 * igpt] = value;
        zout[2 * igpt + 1] = 0.0; // Make zero assignment cleaner
    }
}