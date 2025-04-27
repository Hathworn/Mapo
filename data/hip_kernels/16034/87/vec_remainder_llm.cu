#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING : device_sum size should be gridDim.x
__global__ void vec_remainder(int n, double *result, double *x, double *y) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Combine thread and block indices for 1D
    if (id < n) {
        result[id] = remainder(x[id], y[id]); // Compute the remainder
    }
}