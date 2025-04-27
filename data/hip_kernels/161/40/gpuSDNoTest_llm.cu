#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuSDNoTest(const float *vectsA, size_t na, const float *vectsB, size_t nb, size_t dim, const float *means, const float *numPairs, float *sds)
{
    size_t
        offset, stride,
        tx = threadIdx.x,
        bx = blockIdx.x, by = blockIdx.y;
    float a, b, termA, termB;
    __shared__ float meanA, meanB, n;
    __shared__ float threadSumsA[NUMTHREADS], threadSumsB[NUMTHREADS];

    if ((bx >= na) || (by >= nb))
        return;

    if (tx == 0) {
        meanA = means[bx * nb * 2 + by * 2];
        meanB = means[bx * nb * 2 + by * 2 + 1];
        n = numPairs[bx * nb + by];
    }
    __syncthreads();

    threadSumsA[tx] = 0.f;
    threadSumsB[tx] = 0.f;
    
    for (offset = tx; offset < dim; offset += NUMTHREADS) {
        a = vectsA[bx * dim + offset];
        b = vectsB[by * dim + offset];

        termA = a - meanA;  // Calculate the difference from mean for vectsA
        termB = b - meanB;  // Calculate the difference from mean for vectsB
        threadSumsA[tx] += termA * termA;  // Sum squared differences for vectsA
        threadSumsB[tx] += termB * termB;  // Sum squared differences for vectsB
    }
    __syncthreads();

    // Reduce the sum of squares within the block using parallel reduction
    for (stride = NUMTHREADS >> 1; stride > 0; stride >>= 1) {
        if (tx < stride) {
            threadSumsA[tx] += threadSumsA[tx + stride];  // Reduce sums for vectsA
            threadSumsB[tx] += threadSumsB[tx + stride];  // Reduce sums for vectsB
        }
        __syncthreads();
    }
    
    if (tx == 0) {
        sds[bx * nb * 2 + by * 2] = sqrtf(threadSumsA[0] / (n - 1.f));  // Calculate standard deviation for vectsA
        sds[bx * nb * 2 + by * 2 + 1] = sqrtf(threadSumsB[0] / (n - 1.f));  // Calculate standard deviation for vectsB
    }
}