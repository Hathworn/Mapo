#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vector_add_cu(float *out, float *a, float *b, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    if (idx < n) { // Ensure index is within bounds
        out[idx] = a[idx] + b[idx]; // Vector addition
    }
}