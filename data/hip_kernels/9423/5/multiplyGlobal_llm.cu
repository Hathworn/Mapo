#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiplyGlobal(unsigned const* left, unsigned const* right, unsigned* result, size_t size)
{
    // Calculate unique thread index for row and column
    auto row = blockIdx.y * blockDim.y + threadIdx.y;
    auto col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check boundaries
    if (row < size && col < size) {
        unsigned sum = 0; // Use unsigned to avoid automatic type conversion

        // Use shared memory to reduce global memory access
        __shared__ unsigned sharedLeft[blockDim.y][blockDim.x];
        __shared__ unsigned sharedRight[blockDim.y][blockDim.x];

        for (int tile = 0; tile < size / blockDim.x + (size % blockDim.x == 0 ? 0 : 1); tile++) {
            if (row < size && tile * blockDim.x + threadIdx.x < size) {
                sharedLeft[threadIdx.y][threadIdx.x] = left[row * size + tile * blockDim.x + threadIdx.x];
            } else {
                sharedLeft[threadIdx.y][threadIdx.x] = 0;
            }

            if (col < size && tile * blockDim.y + threadIdx.y < size) {
                sharedRight[threadIdx.y][threadIdx.x] = right[(tile * blockDim.y + threadIdx.y) * size + col];
            } else {
                sharedRight[threadIdx.y][threadIdx.x] = 0;
            }

            __syncthreads(); // Synchronize threads to ensure all data is loaded into shared memory

            for (int k = 0; k < blockDim.x; k++) {
                sum += sharedLeft[threadIdx.y][k] * sharedRight[k][threadIdx.x];
            }

            __syncthreads(); // Make sure all calculations are complete before loading next tile
        }

        result[row * size + col] = sum; // Write result to global memory
    }
}