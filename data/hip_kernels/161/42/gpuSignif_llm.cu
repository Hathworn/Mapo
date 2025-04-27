#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuSignif(const float* gpuNumPairs, const float* gpuCorrelations, size_t n, float* gpuTScores)
{
    size_t bx = blockIdx.x;
    size_t tx = threadIdx.x;
    size_t start = bx * NUMTHREADS * THREADWORK + tx * THREADWORK;

    // Unroll loop for better performance
    #pragma unroll
    for (size_t i = 0; i < THREADWORK; i++) {
        size_t index = start + i;
        if (index < n) {
            float npairs = gpuNumPairs[index];
            float cor = gpuCorrelations[index];
            float radicand = (npairs - 2.f) / (1.f - cor * cor);
            gpuTScores[index] = cor * sqrtf(radicand);
        }
    }
}