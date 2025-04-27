```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to perform matrix multiplication
__global__ void matmul_v0(float* a, float* b, float* c, int n) {
    // Calculate row and column index for this thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread operates within matrix bounds
    if (i >= n || j >= n) return;

    // Initialize the local register for result accumulation
    float c_ij = 0;

    // Loop to accumulate the dot product
    // Unroll the loop manually to optimize
    #pragma unroll
    for (int k = 0; k < n; k++) {
        c_ij += a[n * j + k] * b[n * k + i];
    }

    // Store computed value in the result matrix
    c[n * j + i] = c_ij;
}