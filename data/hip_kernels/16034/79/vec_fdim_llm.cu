#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_fdim(int n, double *result, double *x, double *y) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplify thread index calculation
    if (id < n) {
        result[id] = fdim(x[id], y[id]); // Compute positive difference
    }
}