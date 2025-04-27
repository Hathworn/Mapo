#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperation(int *a, int *b, int *res, int x, int n) {
    // Use efficient memory access pattern by calculating once and reusing
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid < n) {
        int b_val = b[tid] * x; // Precompute b[tid] * x
        res[tid] = a[tid] - b_val; // Use precomputed value
    }
}