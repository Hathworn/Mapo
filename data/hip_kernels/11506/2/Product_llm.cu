#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Product(float *a, float *b, float *c) {
    float cval = 0.00;
    int R = blockIdx.y * blockDim.y + threadIdx.y; // Row of the matrix
    int C = blockIdx.x * blockDim.x + threadIdx.x; // Column of the matrix
    int N = 1000; // Define the size of the matrix
    
    // Check if thread is within matrix bounds
    if (R < N && C < N) {
        // Use coalesced memory access for improved performance
        for (int j = 0; j < N; j++) {
            cval += a[R * N + j] * b[j * N + C];
        }
        c[R * N + C] = cval;
    }
}