#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_copy_cr_cu_z(const double *zin, double *dout, const int n) {
    int igpt = blockIdx.x * blockDim.x + threadIdx.x; // Compute the thread's unique index

    for (int idx = igpt; idx < n; idx += blockDim.x * gridDim.x) {
        dout[idx] = zin[2 * idx]; // Copy and stride over zin
    }
}