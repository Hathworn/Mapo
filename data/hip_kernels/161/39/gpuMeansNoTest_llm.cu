#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

// Optimized kernel function
__global__ void gpuMeansNoTest(const float *vectsA, size_t na, const float *vectsB, size_t nb, size_t dim, float *means, float *numPairs) {
    size_t bx = blockIdx.x, by = blockIdx.y, tx = threadIdx.x;
    float a, b;

    __shared__ float threadSumsA[NUMTHREADS], threadSumsB[NUMTHREADS], count[NUMTHREADS];

    // Check if the block indices are in range
    if ((bx >= na) || (by >= nb)) return;

    // Initialize shared memory
    threadSumsA[tx] = 0.f;
    threadSumsB[tx] = 0.f;
    count[tx] = 0.f;

    // Improve memory coalescing by iterating with stride
    for (size_t offset = tx; offset < dim; offset += NUMTHREADS) {
        a = vectsA[bx * dim + offset];
        b = vectsB[by * dim + offset];

        threadSumsA[tx] += a;
        threadSumsB[tx] += b;
        count[tx] += 1.f;
    }
    __syncthreads();

    // Reduce with a single loop, combining into fewer instructions
    for (size_t stride = NUMTHREADS >> 1; stride > 0; stride >>= 1) {
        if (tx < stride) {
            threadSumsA[tx] += threadSumsA[tx + stride];
            threadSumsB[tx] += threadSumsB[tx + stride];
            count[tx] += count[tx + stride];
        }
        __syncthreads();
    }

    // Atomic operations for writing results to global memory by the first thread
    if (tx == 0) {
        means[bx * nb * 2 + by * 2] = threadSumsA[0] / count[0];
        means[bx * nb * 2 + by * 2 + 1] = threadSumsB[0] / count[0];
        numPairs[bx * nb + by] = count[0];
    }
}