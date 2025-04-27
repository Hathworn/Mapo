#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_hypot(int n, double *result, double *x, double *y) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Optimize indexing for 1D grid
    if (id < n) {
        result[id] = hypot(x[id], y[id]);
    }
}