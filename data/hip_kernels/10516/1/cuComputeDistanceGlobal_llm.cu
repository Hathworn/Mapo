#include "hip/hip_runtime.h"
#include "includes.h"

// Constants used by the program
#define BLOCK_DIM                      16

// Kernel function for computing distances
__global__ void cuComputeDistanceGlobal(float* A, int wA, float* B, int wB, int dim, float* AB) {
    // Shared memory for sub-matrices of A and B
    __shared__ float shared_A[BLOCK_DIM][BLOCK_DIM];
    __shared__ float shared_B[BLOCK_DIM][BLOCK_DIM];

    // Thread index
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Initialize variables
    float ssd = 0;

    // Calculate start positions
    int begin_A = BLOCK_DIM * blockIdx.y * wA;
    int begin_B = BLOCK_DIM * blockIdx.x * wB;
    int end_A = begin_A + (dim - 1) * wA;

    // Conditions
    bool cond0 = (begin_A + tx < wA * dim);  // Condition for matrix A
    bool cond1 = (begin_B + tx < wB * dim);  // Condition for matrix B

    // Iterate over sub-matrices
    for (int a = begin_A, b = begin_B; a <= end_A; a += BLOCK_DIM * wA, b += BLOCK_DIM * wB) {
        // Load data to shared memory
        shared_A[ty][tx] = (cond0 && (a / wA + ty) < dim) ? A[a + wA * ty + tx] : 0;
        shared_B[ty][tx] = (cond1 && (b / wB + ty) < dim) ? B[b + wB * ty + tx] : 0;

        // Synchronize to ensure shared memory loading is complete
        __syncthreads();

        // Compute squared differences and accumulate
        for (int k = 0; k < BLOCK_DIM; ++k) {
            float diff = shared_A[k][ty] - shared_B[k][tx];
            ssd += diff * diff;
        }

        // Synchronize before loading next sub-matrices
        __syncthreads();
    }

    // Write result to global memory
    if (cond0 && cond1) {
        AB[(BLOCK_DIM * blockIdx.y + ty) * wB + BLOCK_DIM * blockIdx.x + tx] = ssd;
    }
}