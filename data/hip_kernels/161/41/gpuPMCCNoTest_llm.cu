#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuPMCCNoTest(const float * vectsa, size_t na, const float * vectsb, size_t nb, size_t dim, const float * numPairs, const float * means, const float * sds, float * correlations) {
    size_t x = blockIdx.x, y = blockIdx.y, tx = threadIdx.x;
    float n, scoreA, scoreB;
    __shared__ float meanA, meanB, sdA, sdB, threadSums[NUMTHREADS];

    if ((x >= na) || (y >= nb))
        return;

    // Load shared memory only once
    if (tx == 0) {
        size_t index = x * nb * 2 + y * 2;
        meanA = means[index];
        meanB = means[index + 1];
        sdA = sds[index];
        sdB = sds[index + 1];
        n = numPairs[x * nb + y];
    }
    __syncthreads();

    float localSum = 0.f;
    // Simplified loop to accumulate scores
    for (size_t offset = tx; offset < dim; offset += NUMTHREADS) {
        float a = vectsa[x * dim + offset];
        float b = vectsb[y * dim + offset];
        scoreA = (a - meanA) / sdA;
        scoreB = (b - meanB) / sdB;
        localSum += scoreA * scoreB;
    }

    threadSums[tx] = localSum;
    __syncthreads();

    // Optimized reduction using warp synchronization
    for (size_t stride = NUMTHREADS >> 1; stride > 0; stride >>= 1) {
        if (tx < stride) {
            threadSums[tx] += threadSums[tx + stride];
        }
        __syncthreads();
    }

    // Write final result to output
    if (tx == 0) {
        correlations[x * nb + y] = threadSums[0] / (n - 1.f);
    }
}