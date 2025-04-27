#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void var(float * __restrict__ M1, float * __restrict__ M2, float * __restrict__ X, int b, size_t nele) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < nele) {
        // Cache output of index to registers to reduce repetitive memory fetch
        float m1 = M1[idx];
        float x = X[idx];

        float delta = x - m1;
        m1 += delta / (b + 1);

        // Store only once to global memory
        M1[idx] = m1;
        M2[idx] += delta * (x - m1);
    }
}