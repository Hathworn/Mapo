#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vector_add(float *out, float *a, float *b, int n) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Each thread processes one element
    if (idx < n) {
        out[idx] = a[idx] + b[idx];
    }
}