#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mmul(const float *A, const float *B, float *C, int ds) {

    // Declare cache in shared memory
    __shared__ float As[block_size][block_size];
    __shared__ float Bs[block_size][block_size];

    int idx = threadIdx.x + blockDim.x * blockIdx.x; // Create thread x index
    int idy = threadIdx.y + blockDim.y * blockIdx.y; // Create thread y index

    float temp = 0; // Initialize temp outside of if-condition for later reuse

    // Use in-bound checks around computation for better warp efficiency
    if (idx < ds && idy < ds) {
        for (int i = 0; i < ds / block_size; i++) {

            // Load data into shared memory with boundary checks
            if (threadIdx.x < block_size && threadIdx.y < block_size) {
                As[threadIdx.y][threadIdx.x] = A[idy * ds + (i * block_size + threadIdx.x)];
                Bs[threadIdx.y][threadIdx.x] = B[(i * block_size + threadIdx.y) * ds + idx];
            }

            // Synchronize
            __syncthreads();

            // Perform calculations while caches are available
            for (int k = 0; k < block_size; k++)
                temp += As[threadIdx.y][k] * Bs[k][threadIdx.x]; // Dot product

            // Synchronize before next iteration
            __syncthreads();
        }

        // Write result to global memory if within bounds
        C[idy * ds + idx] = temp;
    }
}