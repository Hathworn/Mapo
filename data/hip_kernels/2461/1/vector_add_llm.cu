#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void vector_add(float *out, float *a, float *b, int n) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x; // Calculate linear index
    if (idx < n) { // Ensure we don't access out-of-bound elements
        out[idx] = a[idx] + b[idx]; // Perform vector addition
    }
}