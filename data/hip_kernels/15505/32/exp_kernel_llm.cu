#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void exp_kernel(float *v, int n) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary condition and apply exp calculation
    if (x < n) {
        v[x] = expf(v[x]); // Use expf for single-precision
    }
}