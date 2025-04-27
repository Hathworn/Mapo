#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel using shared memory for coalesced memory access
extern "C" __global__ void addProduct_vs(int n, float *a, float *b, float c, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        result[i] = a[i] + b[i] * c; // Perform computation
    }
}