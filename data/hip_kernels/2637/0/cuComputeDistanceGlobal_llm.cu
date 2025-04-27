```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Constants used by the program
#define BLOCK_DIM                      16
#define DEBUG                          0

__global__ void cuComputeDistanceGlobal(float* A, int wA, float* B, int wB, int dim, float* AB) {
    // Shared memory arrays for sub-matrices
    __shared__ float shared_A[BLOCK_DIM][BLOCK_DIM];
    __shared__ float shared_B[BLOCK_DIM][BLOCK_DIM];

    // Thread indices
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    
    // Calculate block indices
    int block_A = BLOCK_DIM * blockIdx.y;
    int block_B = BLOCK_DIM * blockIdx.x;

    // Initialize squared sum of differences
    float ssd = 0;

    // Loop over all sub-matrices
    for (int a = block_A, b = block_B, end_A = block_A + (dim - 1) * wA; a <= end_A; a += BLOCK_DIM * wA, b += BLOCK_DIM * wB) {
        // Load elements into shared memory
        shared_A[ty][tx] = (a / wA + ty < dim && block_A + tx < wA) ? A[a + wA * ty + tx] : 0;
        shared_B[ty][tx] = (a / wA + ty < dim && block_B + tx < wB) ? B[b + wB * ty + tx] : 0;

        // Synchronize to ensure shared memory is populated
        __syncthreads();

        // Compute differences and accumulate ssd
        if (block_A + ty < wA && block_B + tx < wB) {
            for (int k = 0; k < BLOCK_DIM; ++k) {
                float tmp = shared_A[k][ty] - shared_B[k][tx];
                ssd += tmp * tmp;
            }
        }
        
        // Synchronize before next iteration
        __syncthreads();
    }
    
    // Write results to global memory
    if (block_A + ty < wA && block_B + tx < wB) {
        AB[(block_A + ty) * wB + block_B + tx] = ssd;
    }
}