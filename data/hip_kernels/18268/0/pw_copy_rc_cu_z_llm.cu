#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_copy_rc_cu_z(const double *din, double *zout, const int n) {
    const int igpt = blockDim.x * (gridDim.x * blockIdx.y + blockIdx.x) + threadIdx.x;

    // Check and directly store the index calculation
    if (igpt < n) {
        int idx = 2 * igpt; // Pre-calculate index to optimize access
        zout[idx] = din[igpt];
        zout[idx + 1] = 0.0e0;
    }
}