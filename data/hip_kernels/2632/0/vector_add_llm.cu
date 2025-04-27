```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vector_add(float *out, float *a, float *b, int n) {
    // Calculate the global index for the current thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds before performing operation
    if (index < n) {
        out[index] = a[index] + b[index];
    }
}