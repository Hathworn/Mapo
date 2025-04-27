#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMartixByMatrixElementwise(const int nThreads, const float *m1, const float *m2, float *output) {
    // Optimize accessing memory by minimizing thread divergence and improving coalesced memory access
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < nThreads) {
        output[i] = m1[i] * m2[i];  // Perform elementwise multiplication
    }
}