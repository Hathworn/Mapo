#include "hip/hip_runtime.h"
#include "includes.h"

#define N 10000000
#define MAX_ERR 1e-6

__global__ void vector_add(float* out, float* a, float* b, int n) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Process all elements each thread is responsible for
    for (int i = index; i < n; i += blockDim.x * gridDim.x) {
        out[i] = a[i] + b[i];
    }
}