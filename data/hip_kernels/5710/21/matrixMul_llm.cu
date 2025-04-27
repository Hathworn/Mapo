#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16 // Define TILE_WIDTH if not already defined

__global__ void matrixMul(float* A, float* B, float* C, int width)
{
    __shared__ float As[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Bs[TILE_WIDTH][TILE_WIDTH];
    
    int row = blockIdx.y * TILE_WIDTH + threadIdx.y;
    int col = blockIdx.x * TILE_WIDTH + threadIdx.x;
    float c_val = 0.0f;
    
    for(int i = 0; i < width/TILE_WIDTH; i++)
    {
        // Load matrix elements from global memory into shared memory
        As[threadIdx.y][threadIdx.x] = A[row * width + (i * TILE_WIDTH + threadIdx.x)];
        Bs[threadIdx.y][threadIdx.x] = B[(i * TILE_WIDTH + threadIdx.y) * width + col];
        __syncthreads(); // Synchronize to ensure all threads have loaded their data

        // Perform matrix multiplication within a tile
        #pragma unroll
        for(int k = 0; k < TILE_WIDTH; k++)
        {
            c_val += As[threadIdx.y][k] * Bs[k][threadIdx.x];
        }
        
        __syncthreads(); // Synchronize before loading new tile
    }
    
    // Store the result into global memory
    C[row * width + col] = c_val;
}