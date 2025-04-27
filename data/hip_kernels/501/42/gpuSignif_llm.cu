#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuSignif(const float * gpuNumPairs, const float * gpuCorrelations, size_t n, float * gpuTScores)
{
    // Calculate global thread ID
    const size_t global_tid = blockIdx.x * blockDim.x * THREADWORK + threadIdx.x * THREADWORK;
    
    for (int i = 0; i < THREADWORK; ++i) {
        size_t idx = global_tid + i;
        if (idx >= n)
            break;

        float npairs = gpuNumPairs[idx];
        float cor = gpuCorrelations[idx];
        // Precompute common expression
        float radicand = (npairs - 2.f) / (1.f - cor * cor);
        // Directly write to global memory
        gpuTScores[idx] = cor * sqrtf(radicand);
    }
}