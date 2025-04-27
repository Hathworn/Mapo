#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multiplyVectors(float* A, float* B, float* C, int WIDTH, int HEIGHT) {
    // Calculate global thread ID for column and row
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure within boundaries
    if (x < WIDTH && y < HEIGHT) {
        double result = 0.0;
        
        // Use shared memory to optimize memory access patterns
        extern __shared__ float sharedB[];
        
        for (int i = 0; i < WIDTH; i += blockDim.x) {
            // Load a block of B columns into shared memory
            if (i + threadIdx.x < WIDTH)
                sharedB[threadIdx.y * blockDim.x + threadIdx.x] = B[(i + threadIdx.x) * WIDTH + x];
            __syncthreads();
            
            // Perform multiplication using the loaded block of B
            for (int j = 0; j < blockDim.x && i + j < WIDTH; ++j) {
                result += A[y * WIDTH + (i + j)] * sharedB[threadIdx.y * blockDim.x + j];
            }
            __syncthreads();
        }

        C[y * WIDTH + x] = result;
    }
}