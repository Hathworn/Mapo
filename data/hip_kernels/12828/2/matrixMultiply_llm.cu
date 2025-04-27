#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultiply(float* a, float* b, float* c, int n)
{
    // Define shared memory for A and B tiles
    extern __shared__ float shared[];

    // Use block dimensions to calculate column and row
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Declare shared memory pointers for A and B tiles
    float* shared_a = shared;
    float* shared_b = shared + blockDim.x * blockDim.y;

    // Initialize C matrix element to zero
    float cValue = 0.0f;

    // Loop over tiles
    for (int tileIdx = 0; tileIdx < n / blockDim.x; ++tileIdx) {
        
        // Load A and B matrices into shared memory
        shared_a[threadIdx.y * blockDim.x + threadIdx.x] = a[row * n + tileIdx * blockDim.x + threadIdx.x];
        shared_b[threadIdx.y * blockDim.x + threadIdx.x] = b[(tileIdx * blockDim.y + threadIdx.y) * n + col];
        
        // Synchronize to make sure the matrices are loaded
        __syncthreads();

        // Multiply shared memory elements
        for (int k = 0; k < blockDim.x; ++k) {
            cValue += shared_a[threadIdx.y * blockDim.x + k] * shared_b[k * blockDim.x + threadIdx.x];
        }
        
        // Synchronize before loading the next tile
        __syncthreads();
    }

    // Assign the computed value to the output matrix
    c[row * n + col] = cValue;
}