```c
#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuMeansNoTest(const float * vectsA, size_t na, const float * vectsB, size_t nb, size_t dim, float * means, float * numPairs)
{
    size_t bx = blockIdx.x, by = blockIdx.y, tx = threadIdx.x;
    float a, b, sumA = 0.f, sumB = 0.f, localCount = 0.f;

    extern __shared__ float sharedMem[];
    float * threadSumsA = sharedMem;
    float * threadSumsB = sharedMem + NUMTHREADS;
    float * count = sharedMem + 2 * NUMTHREADS;

    if((bx >= na) || (by >= nb))
        return;

    for(size_t offset = tx; offset < dim; offset += NUMTHREADS) {
        a = vectsA[bx * dim + offset];
        b = vectsB[by * dim + offset];

        sumA += a;
        sumB += b;
        localCount += 1.f;
    }

    threadSumsA[tx] = sumA;
    threadSumsB[tx] = sumB;
    count[tx] = localCount;
    __syncthreads();

    for(size_t stride = NUMTHREADS >> 1; stride > 0; stride >>= 1) {
        if(tx < stride) {
            threadSumsA[tx] += threadSumsA[tx + stride];
            threadSumsB[tx] += threadSumsB[tx + stride];
            count[tx] += count[tx + stride];
        }
        __syncthreads();
    }

    if(tx == 0) {
        means[bx*nb*2+by*2] = threadSumsA[0] / count[0];
        means[bx*nb*2+by*2+1] = threadSumsB[0] / count[0];
        numPairs[bx*nb+by] = count[0];
    }
}