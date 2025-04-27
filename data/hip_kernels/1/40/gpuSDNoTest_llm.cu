#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuSDNoTest(const float *vectsA, size_t na, const float *vectsB, size_t nb, size_t dim, const float *means, const float *numPairs, float *sds)
{
    size_t tx = threadIdx.x;
    size_t bx = blockIdx.x, by = blockIdx.y;
    float termA, termB;
    __shared__ float meanA, meanB, n;
    __shared__ float threadSumsA[NUMTHREADS], threadSumsB[NUMTHREADS];

    // Ensure block is within bounds
    if (bx >= na || by >= nb)
        return;

    // Load shared memory data
    if (tx == 0) {
        meanA = means[bx * nb * 2 + by * 2];
        meanB = means[bx * nb * 2 + by * 2 + 1];
        n = numPairs[bx * nb + by];
    }
    __syncthreads();

    // Initialize shared thread sums in parallel
    threadSumsA[tx] = 0.f;
    threadSumsB[tx] = 0.f;

    // Calculate thread-specific sums
    for (size_t offset = tx; offset < dim; offset += NUMTHREADS) {
        float a = vectsA[bx * dim + offset];
        float b = vectsB[by * dim + offset];

        termA = a - meanA;
        termB = b - meanB;
        threadSumsA[tx] += termA * termA;
        threadSumsB[tx] += termB * termB;
    }
    __syncthreads();

    // Reduce sums within block using warp-efficient approach
    for (size_t stride = NUMTHREADS >> 1; stride > 0; stride >>= 1) {
        if (tx < stride) {
            threadSumsA[tx] += threadSumsA[tx + stride];
            threadSumsB[tx] += threadSumsB[tx + stride];
        }
        __syncthreads();
    }

    // Compute final results
    if (tx == 0) {
        sds[bx * nb * 2 + by * 2] = sqrtf(threadSumsA[0] / (n - 1.f));
        sds[bx * nb * 2 + by * 2 + 1] = sqrtf(threadSumsB[0] / (n - 1.f));
    }
}