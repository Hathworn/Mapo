#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuComputeDistanceGlobal(float* A, int wA, float* B, int wB, int dim, float* AB) {

    // Shared memory for sub-matrix of A and B
    __shared__ float shared_A[BLOCK_DIM][BLOCK_DIM];
    __shared__ float shared_B[BLOCK_DIM][BLOCK_DIM];

    // Thread index
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Block index for A and B
    int aBegin = BLOCK_DIM * blockIdx.y;
    int bBegin = BLOCK_DIM * blockIdx.x;
    int aEnd = aBegin + (dim - 1) * wA;
    int aStep = BLOCK_DIM * wA;
    int bStep = BLOCK_DIM * wB;

    // For storage and computation
    float ssd = 0.0;
    float tmp;

    // Load and compute loop
    for (int a = aBegin, b = bBegin; a <= aEnd; a += aStep, b += bStep) {
        // Load elements from global memory to shared memory
        shared_A[ty][tx] = (a / wA + ty < dim && a + wA * ty + tx < wA * dim) ? A[a + wA * ty + tx] : 0.0f;
        shared_B[ty][tx] = (b + wB * ty + tx < wB * dim) ? B[b + wB * ty + tx] : 0.0f;

        // Synchronize threads to ensure all data is loaded
        __syncthreads();

        // Compute the sum of squared differences
        #pragma unroll
        for (int k = 0; k < BLOCK_DIM; ++k) {
            tmp = shared_A[k][ty] - shared_B[k][tx];
            ssd += tmp * tmp;
        }

        // Synchronize threads before next iteration
        __syncthreads();
    }

    // Write computed result back to global memory
    if ((aBegin + ty < wA) && (bBegin + tx < wB)) {
        AB[(aBegin + ty) * wB + bBegin + tx] = ssd;
    }
}