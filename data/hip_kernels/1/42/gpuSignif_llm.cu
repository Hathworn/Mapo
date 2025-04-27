#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuSignif(const float *gpuNumPairs, const float *gpuCorrelations, size_t n, float *gpuTScores) {
    size_t bx = blockIdx.x, tx = threadIdx.x;
    int idx = bx * NUMTHREADS * THREADWORK + tx * THREADWORK;

    // Use shared memory to reduce global memory access latency
    __shared__ float sharedNumPairs[THREADWORK];
    __shared__ float sharedCorrelations[THREADWORK];

    // Load data into shared memory
    for (int i = 0; i < THREADWORK; i++) {
        if (idx + i < n) {
            sharedNumPairs[i] = gpuNumPairs[idx + i];
            sharedCorrelations[i] = gpuCorrelations[idx + i];
        }
    }
    __syncthreads(); // Ensure all threads have loaded the data

    for (int i = 0; i < THREADWORK; i++) {
        if (idx + i >= n)
            break;

        float npairs = sharedNumPairs[i];
        float cor = sharedCorrelations[i];
        float radicand = (npairs - 2.f) / (1.f - cor * cor);
        gpuTScores[idx + i] = cor * sqrtf(radicand);
    }
}