#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_log10 (int n, double *result, double *x) {
    int id = threadIdx.x + blockIdx.x * blockDim.x; // Flattened thread index for 1D grid
    if (id < n) {
        result[id] = log10(x[id]); // Compute log10 if within bounds
    }
}