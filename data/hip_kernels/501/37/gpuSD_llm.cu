```c
#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuSD(const float *vectsA, size_t na, const float *vectsB, size_t nb, size_t dim, const float *means, const float *numPairs, float *sds) {
    size_t tx = threadIdx.x;
    size_t bx = blockIdx.x, by = blockIdx.y;
    float a, b, termA, termB;
    __shared__ float meanA, meanB, n;
    __shared__ float threadSumsA[NUMTHREADS], threadSumsB[NUMTHREADS];

    if ((bx >= na) || (by >= nb)) return; // Boundary check

    // Load shared memory for mean and n
    if (tx == 0) {
        meanA = means[bx * nb * 2 + by * 2];
        meanB = means[bx * nb * 2 + by * 2 + 1];
        n = numPairs[bx * nb + by];
    }
    __syncthreads();

    // Initialize shared thread sums
    threadSumsA[tx] = 0.f;
    threadSumsB[tx] = 0.f;
    
    // Calculate partial sums
    for (size_t offset = tx; offset < dim; offset += NUMTHREADS) {
        a = vectsA[bx * dim + offset];
        b = vectsB[by * dim + offset];
        // Ensure valid elements
        if (!(isnan(a) || isnan(b))) {
            termA = a - meanA;
            termB = b - meanB;
            threadSumsA[tx] += termA * termA;
            threadSumsB[tx] += termB * termB;
        }
    }
    __syncthreads();

    // Reduce sums
    for (size_t stride = NUMTHREADS / 2; stride > 0; stride >>= 1) {
        if (tx < stride) {
            threadSumsA[tx] += threadSumsA[tx + stride];
            threadSumsB[tx] += threadSumsB[tx + stride];
        }
        __syncthreads();
    }
    
    // Write result
    if (tx == 0) {
        sds[bx * nb * 2 + by * 2]     = sqrtf(threadSumsA[0] / (n - 1.f));
        sds[bx * nb * 2 + by * 2 + 1] = sqrtf(threadSumsB[0] / (n - 1.f));
    }
}