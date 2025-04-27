#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuSD(const float * vectsA, size_t na, const float * vectsB, size_t nb, size_t dim, const float * means, const float * numPairs, float * sds)
{
    size_t tx = threadIdx.x;
    size_t bx = blockIdx.x, by = blockIdx.y;

    // Early return if block indices exceed available data
    if((bx >= na) || (by >= nb)) return;

    __shared__ float meanA, meanB, n;
    __shared__ float threadSumsA[NUMTHREADS], threadSumsB[NUMTHREADS];

    if(tx == 0) {
        meanA = means[bx*nb*2+by*2];
        meanB = means[bx*nb*2+by*2+1];
        n = numPairs[bx*nb+by];
    }
    __syncthreads();

    // Initialize thread sums
    float sumA = 0.f, sumB = 0.f;

    // Unroll the loop for performance optimization
    for(size_t offset = tx; offset < dim; offset += NUMTHREADS) {
        float a = vectsA[bx * dim + offset];
        float b = vectsB[by * dim + offset];
        if(!(isnan(a) || isnan(b))) {
            float termA = a - meanA;
            float termB = b - meanB;
            sumA += termA * termA;
            sumB += termB * termB;
        }
    }
    threadSumsA[tx] = sumA;
    threadSumsB[tx] = sumB;
    __syncthreads();

    // Reduce within shared memory using binary tree reduction
    for(size_t stride = NUMTHREADS >> 1; stride > 0; stride >>= 1) {
        if(tx < stride) {
            threadSumsA[tx] += threadSumsA[tx + stride];
            threadSumsB[tx] += threadSumsB[tx + stride];
        }
        __syncthreads();
    }

    // Only thread 0 updates the result
    if(tx == 0) {
        sds[bx*nb*2+by*2]   = sqrtf(threadSumsA[0] / (n - 1.f));
        sds[bx*nb*2+by*2+1] = sqrtf(threadSumsB[0] / (n - 1.f));
    }
}