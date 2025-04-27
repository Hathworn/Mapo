#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuMeans(const float *vectsA, size_t na, const float *vectsB, size_t nb, size_t dim, float *means, float *numPairs)
{
    size_t bx = blockIdx.x, by = blockIdx.y, tx = threadIdx.x;
    float a, b;

    __shared__ float threadSumsA[NUMTHREADS], threadSumsB[NUMTHREADS], count[NUMTHREADS];

    if ((bx >= na) || (by >= nb))
        return;

    float sumA = 0.0f;  // Local variable for accumulated sum A
    float sumB = 0.0f;  // Local variable for accumulated sum B
    float cnt = 0.0f;  // Local variable for count

    for (size_t offset = tx; offset < dim; offset += NUMTHREADS) {
        a = vectsA[bx * dim + offset];
        b = vectsB[by * dim + offset];
        if (!(isnan(a) || isnan(b))) {
            sumA += a;
            sumB += b;
            cnt += 1.0f;
        }
    }

    // Store local sums into shared memory
    threadSumsA[tx] = sumA;
    threadSumsB[tx] = sumB;
    count[tx] = cnt;
    __syncthreads();

    // Reduce within block
    for (size_t stride = NUMTHREADS >> 1; stride > 0; stride >>= 1) {
        if (tx < stride) {
            threadSumsA[tx] += threadSumsA[tx + stride];
            threadSumsB[tx] += threadSumsB[tx + stride];
            count[tx] += count[tx + stride];
        }
        __syncthreads();
    }

    // Write final result for block
    if (tx == 0) {
        means[bx * nb * 2 + by * 2] = threadSumsA[0] / count[0];
        means[bx * nb * 2 + by * 2 + 1] = threadSumsB[0] / count[0];
        numPairs[bx * nb + by] = count[0];
    }
}