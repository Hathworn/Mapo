#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vector_add_cu(float *out, float *a, float *b, int n) {
    // Calculate the global index for this thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread index is within bounds
    if (i < n) {
        out[i] = a[i] + b[i];
    }
}