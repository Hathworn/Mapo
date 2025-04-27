#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vector_add(float *out, float *a, float *b, int n) {
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index

    if (index < n) { // Ensure index is within bounds
        out[index] = a[index] + b[index];
    }
}