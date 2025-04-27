#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void lifter(float* cepstrum, int nCoefs, int nhalf) {
    int k = blockIdx.x * blockDim.x + threadIdx.x + nCoefs;

    // Check and compute only when k is in range
    if (k < nhalf + 2) {
        cepstrum[k] = 0.0;
    }
}