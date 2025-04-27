#include "hip/hip_runtime.h"
#include "includes.h"

// Constants used by the program
#define BLOCK_DIM                      16
#define DEBUG                          0

__global__ void cuComputeDistanceGlobal(float* A, int wA, float* B, int wB, int dim, float* AB) {
    // Shared memory for sub-matrix of A and B
    __shared__ float shared_A[BLOCK_DIM][BLOCK_DIM];
    __shared__ float shared_B[BLOCK_DIM][BLOCK_DIM];

    // Thread index
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Calculate block indices
    int block_A = BLOCK_DIM * blockIdx.y; 
    int block_B = BLOCK_DIM * blockIdx.x; 

    // Other variables
    float ssd = 0;

    // Conditions for current block
    int valid_A = (block_A + ty < wA);
    int valid_B = (block_B + tx < wB);

    // Loop over all sub-matrices of A and B required to compute block sub-matrix
    for (int offset = 0; offset < dim; offset += BLOCK_DIM) {
        // Load shared memory
        if ((offset + ty) < dim) {
            shared_A[ty][tx] = (block_A + tx < wA) ? A[block_A + offset * wA + wA * ty + tx] : 0;
            shared_B[ty][tx] = (block_B + tx < wB) ? B[block_B + offset * wB + wB * ty + tx] : 0;
        }

        // Synchronize to ensure all threads have loaded
        __syncthreads();

        // Calculate ssd for current submatrix
        if (valid_A && valid_B) {
            for (int k = 0; k < BLOCK_DIM; ++k) {
                float tmp = shared_A[ty][k] - shared_B[tx][k];
                ssd += tmp * tmp;
            }
        }

        // Synchronize before the next load
        __syncthreads();
    }

    // Write result to global memory
    if (valid_A && valid_B) {
        AB[(block_A + ty) * wB + block_B + tx] = ssd;
    }
}