#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_DIM 16  // Assuming BLOCK_DIM is defined

__global__ void cuComputeDistanceGlobal(float* A, int wA, int pA, float* B, int wB, int pB, int dim, float* AB){
    extern __shared__ float shared_mem[]; // Use shared memory efficiently 
    float* shared_A = shared_mem;
    float* shared_B = shared_mem + BLOCK_DIM * BLOCK_DIM;

    int tx = threadIdx.x;
    int ty = threadIdx.y;

    float ssd = 0;

    int begin_A = BLOCK_DIM * blockIdx.y;
    int begin_B = BLOCK_DIM * blockIdx.x;
    int step_A = BLOCK_DIM * pA;
    int step_B = BLOCK_DIM * pB;
    int end_A = begin_A + (dim - 1) * pA;

    int cond0 = (begin_A + tx < wA);
    int cond1 = (begin_B + tx < wB);
    int cond2 = (begin_A + ty < wA);

    for (int a = begin_A, b = begin_B; a <= end_A; a += step_A, b += step_B) {
        if (a / pA + ty < dim) {
            shared_A[ty * BLOCK_DIM + tx] = (cond0) ? A[a + pA * ty + tx] : 0;
            shared_B[ty * BLOCK_DIM + tx] = (cond1) ? B[b + pB * ty + tx] : 0;  
        } else {
            shared_A[ty * BLOCK_DIM + tx] = 0;
            shared_B[ty * BLOCK_DIM + tx] = 0;
        }

        __syncthreads();

        if (cond2 && cond1) {
            for (int k = 0; k < BLOCK_DIM; ++k) {
                float tmp = shared_A[k * BLOCK_DIM + ty] - shared_B[k * BLOCK_DIM + tx];
                ssd += tmp * tmp;
            }
        }

        __syncthreads();
    }

    if (cond2 && cond1)
        AB[(begin_A + ty) * pB + begin_B + tx] = ssd;
}