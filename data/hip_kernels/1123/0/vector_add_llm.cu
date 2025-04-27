#include "hip/hip_runtime.h"
#include "includes.h"

#define N 10000000
#define MAX_ERR 1e-6

__global__ void vector_add(float *out, float *a, float *b, int n) {
    // Calculate the global thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform vector addition if idx is within range
    if (idx < n) {
        out[idx] = a[idx] + b[idx];
    }
}