#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vector_add(float *c, const float *a, const float *b, const int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global index
    if (i < n) {
        c[i] = a[i] + b[i];  // Perform addition if within bounds
    }
}