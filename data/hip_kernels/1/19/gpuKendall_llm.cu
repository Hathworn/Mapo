#include "hip/hip_runtime.h"
#include "includes.h"
#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuKendall(const float * a, size_t na, const float * b, size_t nb, size_t sampleSize, double * results)
{
    size_t tx = threadIdx.x, ty = threadIdx.y;
    size_t bx = blockIdx.x, by = blockIdx.y;
    size_t rowa = bx * sampleSize, rowb = by * sampleSize;
    __shared__ float threadSums[NUMTHREADS * NUMTHREADS];

    float concordant = 0.f;

    // Perform computation in parallel
    for(size_t i = tx; i < sampleSize - 1; i += NUMTHREADS) {
        for(size_t j = i + 1 + ty; j < sampleSize; j += NUMTHREADS) {
            concordant += ((a[rowa + j] > a[rowa + i] && b[rowb + j] > b[rowb + i]) ||
                           (a[rowa + j] < a[rowa + i] && b[rowb + j] < b[rowb + i]) ||
                           (a[rowa + j] == a[rowa + i] && b[rowb + j] == b[rowb + i]));
        }
    }
    threadSums[ty * NUMTHREADS + tx] = concordant;

    __syncthreads();

    // Reduce using shared memory
    if (ty == 0) {
        for (size_t i = 1; i < NUMTHREADS; ++i) {
            threadSums[tx * NUMTHREADS] += threadSums[i * NUMTHREADS + tx];
        }
    }

    __syncthreads();

    if (tx == 0 && ty == 0) {
        concordant = threadSums[0];
        float denom = (float)sampleSize;
        denom = (denom * (denom - 1.f)) / 2.f;
        float discordant = denom - concordant;
        float numer = concordant - discordant;
        results[by * na + bx] = ((double)numer) / ((double)denom);
    }
}