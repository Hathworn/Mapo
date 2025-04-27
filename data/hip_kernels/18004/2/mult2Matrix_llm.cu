#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mult2Matrix(float *M, float *N, float *P) {
    __shared__ float shared_m_tile[TILE_WIDTH][TILE_WIDTH]; // Use float for matching input matrix type
    __shared__ float shared_n_tile[TILE_WIDTH][TILE_WIDTH]; // Use float for matching input matrix type

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int col = blockIdx.x * blockDim.x + tx;
    int row = blockIdx.y * blockDim.y + ty;
    
    if (row < WIDTH && col < WIDTH) {
        float result = 0;
        
        for (int phase = 0; phase < (WIDTH + TILE_WIDTH - 1) / TILE_WIDTH; phase++) { // Ensure loop handles full range

            // Load tiles from global memory to shared memory, handle edge cases
            if (row < WIDTH && (phase * TILE_WIDTH + tx) < WIDTH)
                shared_m_tile[ty][tx] = M[row * WIDTH + phase * TILE_WIDTH + tx];
            else
                shared_m_tile[ty][tx] = 0.0;
                
            if (col < WIDTH && (phase * TILE_WIDTH + ty) < WIDTH)
                shared_n_tile[ty][tx] = N[(phase * TILE_WIDTH + ty) * WIDTH + col];
            else
                shared_n_tile[ty][tx] = 0.0;

            __syncthreads();

            for (int k = 0; k < TILE_WIDTH; k++) {
                result += shared_m_tile[ty][k] * shared_n_tile[k][tx];
            }
            __syncthreads();
        }
        P[row * WIDTH + col] = result;
    }
}