#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMartixSubstractMatrix(const int nThreads, const float *m1, const float *m2, float *output) {
    // Calculating global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensures we do not access beyond array bounds
    if (i < nThreads) {
        output[i] = m1[i] - m2[i];
    }
}