#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(long* a, long* b, long* c, long N) {
    long baseIdx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index
    if (baseIdx < N) { // Ensure index is within bounds
        c[baseIdx] = a[baseIdx] * b[baseIdx];
    }
    __syncthreads();

    for (long step = blockDim.x / 2; step > 0; step /= 2) { // Use loop unrolling for reduction
        if (baseIdx < N && baseIdx < step) {
            c[baseIdx] += c[baseIdx + step];
        }
        __syncthreads();
    }
}