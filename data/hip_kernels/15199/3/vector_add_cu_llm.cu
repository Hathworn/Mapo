#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vector_add_cu(float *out, float *a, float *b, int n) {
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread index is within bounds
    if (idx < n) {
        out[idx] = a[idx] + b[idx];
    }
}