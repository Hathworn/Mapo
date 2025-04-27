#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rowDiv(float* a, float* b, float* c, int M, int N) {
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is within bounds
    if (i < M * N) {
        // Divide a[i] by the corresponding row value in b
        c[i] = a[i] / b[blockIdx.x];
    }
}