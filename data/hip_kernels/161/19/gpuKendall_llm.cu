#include "hip/hip_runtime.h"
#include "includes.h"
#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuKendall(const float * a, size_t na, const float * b, size_t nb, size_t sampleSize, double * results)
{
    size_t tx = threadIdx.x, ty = threadIdx.y,
           bx = blockIdx.x, by = blockIdx.y,
           rowa = bx * sampleSize, rowb = by * sampleSize;
    float concordant = 0.f;
    __shared__ float threadSums[NUMTHREADS * NUMTHREADS];

    for (size_t i = tx; i < sampleSize; i += NUMTHREADS) {
        for (size_t j = i + 1 + ty; j < sampleSize; j += NUMTHREADS) {
            concordant += (float)(((a[rowa + j] > a[rowa + i]) && (b[rowb + j] > b[rowb + i])) +
                                  ((a[rowa + j] < a[rowa + i]) && (b[rowb + j] < b[rowb + i])) +
                                  ((a[rowa + j] == a[rowa + i]) && (b[rowb + j] == b[rowb + i])));
        }
    }
    threadSums[ty * NUMTHREADS + tx] = concordant; // Store results in shared memory by transposed order
    __syncthreads();

    // Perform reduction within shared memory using transposed order for coalesced access
    for (size_t stride = NUMTHREADS / 2; stride > 0; stride >>= 1) {
        if (ty < stride) {
            threadSums[ty * NUMTHREADS + tx] += threadSums[(ty + stride) * NUMTHREADS + tx];
        }
        __syncthreads();
    }

    if (ty == 0) {
        // Further reduce across y-dimension
        atomicAdd(&threadSums[tx], threadSums[tx * NUMTHREADS]);
    }
    __syncthreads();

    if ((tx == 0) && (ty == 0)) {
        concordant = threadSums[0];
        float denom = (float)sampleSize;
        denom = (denom * (denom - 1.f)) / 2.f;
        float discordant = denom - concordant;
        float numer = concordant - discordant;
        results[by * na + bx] = ((double)numer) / ((double)denom);
    }
}