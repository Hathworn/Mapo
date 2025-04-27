#include "hip/hip_runtime.h"
#include "includes.h"
#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuKendall(const float * a, size_t na, const float * b, size_t nb, size_t sampleSize, double * results)
{
    size_t tx = threadIdx.x, ty = threadIdx.y, bx = blockIdx.x, by = blockIdx.y;
    size_t rowa = bx * sampleSize, rowb = by * sampleSize;
    float concordant = 0.f, numer, denom;

    __shared__ float threadSums[NUMTHREADS][NUMTHREADS];

    // Optimized loop
    for (size_t i = tx; i < sampleSize; i += NUMTHREADS) {
        for (size_t j = i + 1 + ty; j < sampleSize; j += NUMTHREADS) {
            int tests = ((a[rowa + j] > a[rowa + i]) && (b[rowb + j] > b[rowb + i]))
                        + ((a[rowa + j] < a[rowa + i]) && (b[rowb + j] < b[rowb + i]))
                        + ((a[rowa + j] == a[rowa + i]) && (b[rowb + j] == b[rowb + i]));
            concordant += (float)tests;
        }
    }

    threadSums[tx][ty] = concordant;
    __syncthreads();

    // Reduce within threads using loop unrolling
    for (size_t i = NUMTHREADS / 2; i > 0; i >>= 1) {
        if (ty < i) {
            threadSums[tx][ty] += threadSums[tx][ty + i];
        }
        __syncthreads();
    }
    
    if (ty == 0) {
        // Reduce across thread blocks
        for (size_t i = NUMTHREADS / 2; i > 0; i >>= 1) {
            if (tx < i) {
                threadSums[tx][0] += threadSums[tx + i][0];
            }
            __syncthreads();
        }
    }

    if ((tx == 0) && (ty == 0)) {
        concordant = threadSums[0][0];
        denom = (float)sampleSize;
        denom = (denom * (denom - 1.f)) / 2.f; 
        float discordant = denom - concordant;
        numer = concordant - discordant;
        results[by * na + bx] = ((double)numer) / ((double)denom);
    }
}