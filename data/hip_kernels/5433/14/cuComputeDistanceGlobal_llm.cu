#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuComputeDistanceGlobal(float* A, int wA, float* B, int wB, int dim, float* AB) {

    // Declaration of the shared memory arrays As and Bs used to store the sub-matrix of A and B
    __shared__ float shared_A[BLOCK_DIM][BLOCK_DIM];
    __shared__ float shared_B[BLOCK_DIM][BLOCK_DIM];

    // Thread index
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Block index
    int block_x = blockIdx.x;
    int block_y = blockIdx.y;

    // Other variables
    float ssd = 0;

    // Compute global indices
    int x_a = block_y * BLOCK_DIM + ty;
    int x_b = block_x * BLOCK_DIM + tx;

    int stride_a = BLOCK_DIM * wA;
    int stride_b = BLOCK_DIM * wB;

    for (int k = 0; k < dim; k += BLOCK_DIM) {

        // Load the matrices from device memory to shared memory
        shared_A[ty][tx] = (x_a < wA && k + tx < dim) ? A[x_a * dim + k + tx] : 0;
        shared_B[ty][tx] = (x_b < wB && k + ty < dim) ? B[x_b * dim + k + ty] : 0;

        // Synchronize within the block to ensure shared memory is ready
        __syncthreads();

        if (x_a < wA && x_b < wB) {
            for (int j = 0; j < BLOCK_DIM; ++j) {
                float diff = shared_A[ty][j] - shared_B[j][tx];
                ssd += diff * diff;
            }
        }

        // Synchronize to make sure that the preceding computation is done 
        __syncthreads();
    }

    // Write the result to global memory
    if (x_a < wA && x_b < wB) {
        AB[x_a * wB + x_b] = ssd;
    }
}