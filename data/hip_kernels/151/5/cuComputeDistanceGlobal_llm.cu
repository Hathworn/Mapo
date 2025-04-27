#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuComputeDistanceGlobal(float* A, int wA, int pA, float* B, int wB, int pB, int dim, float* AB) {
    __shared__ float shared_A[BLOCK_DIM][BLOCK_DIM];
    __shared__ float shared_B[BLOCK_DIM][BLOCK_DIM];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int begin_A = BLOCK_DIM * blockIdx.y;
    int begin_B = BLOCK_DIM * blockIdx.x;
    int step_A = BLOCK_DIM * pA;
    int step_B = BLOCK_DIM * pB;
    int end_A = begin_A + (dim - 1) * pA;

    bool cond0 = (begin_A + tx < wA);
    bool cond1 = (begin_B + tx < wB);
    bool cond2 = (begin_A + ty < wA);

    float ssd = 0.0f;

    // Loop over all sub-matrices of A and B required to compute the block sub-matrix
    for (int a = begin_A, b = begin_B; a <= end_A; a += step_A, b += step_B) {
        // Load matrices from device memory to shared memory
        if (a / pA + ty < dim) {
            shared_A[ty][tx] = cond0 ? A[a + pA * ty + tx] : 0;
            shared_B[ty][tx] = cond1 ? B[b + pB * ty + tx] : 0;
        } else {
            shared_A[ty][tx] = 0;
            shared_B[ty][tx] = 0;
        }

        __syncthreads();  // Ensure matrices are loaded

        // Compute difference between matrices
        if (cond2 && cond1) {
            #pragma unroll  // Unroll loop for better performance
            for (int k = 0; k < BLOCK_DIM; ++k) {
                float tmp = shared_A[k][ty] - shared_B[k][tx];
                ssd += tmp * tmp;
            }
        }

        __syncthreads();  // Ensure preceding computation is done
    }

    // Write the block sub-matrix to device memory
    if (cond2 && cond1) {
        AB[(begin_A + ty) * pB + begin_B + tx] = ssd;
    }
}