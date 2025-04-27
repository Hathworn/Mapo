#include "hip/hip_runtime.h"
#include "includes.h"

// Constants used by the program
#define BLOCK_DIM                      16

__global__ void cuComputeDistanceGlobal( float* A, int wA, float* B, int wB, int dim, float* AB) {

    __shared__ float shared_A[BLOCK_DIM][BLOCK_DIM];
    __shared__ float shared_B[BLOCK_DIM][BLOCK_DIM];

    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Start positions in A and B
    int begin_A = BLOCK_DIM * blockIdx.y;
    int begin_B = BLOCK_DIM * blockIdx.x;
    int step_A = BLOCK_DIM * wA;
    int step_B = BLOCK_DIM * wB;
    int end_A = begin_A + (dim - 1) * wA;

    float ssd = 0.0f;

    int cond0 = (begin_A + tx < wA);
    int cond1 = (begin_B + tx < wB);
    int cond2 = (begin_A + ty < wA);

    // Iterate over sub-matrices
    for (int a = begin_A, b = begin_B; a <= end_A; a += step_A, b += step_B) {
        // Load elements into shared memory
        if (a / wA + ty < dim) {
            shared_A[ty][tx] = (cond0) ? A[a + wA * ty + tx] : 0.0f;
            shared_B[ty][tx] = (cond1) ? B[b + wB * ty + tx] : 0.0f;
        } else {
            shared_A[ty][tx] = 0.0f;
            shared_B[ty][tx] = 0.0f;
        }

        __syncthreads();

        // Compute block sub-matrix
        if (cond2 && cond1) {
            #pragma unroll  // Enable loop unrolling for better performance
            for (int k = 0; k < BLOCK_DIM; ++k) {
                float tmp = shared_A[k][ty] - shared_B[k][tx];
                ssd += tmp * tmp;
            }
        }

        __syncthreads();
    }
    
    // Write the results back to global memory
    if (cond2 && cond1)
        AB[(begin_A + ty) * wB + begin_B + tx] = ssd;
}