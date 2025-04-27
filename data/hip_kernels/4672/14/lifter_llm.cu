#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lifter(float* cepstrum, int nCoefs, int nhalf) {
    int k = threadIdx.x + blockDim.x * blockIdx.x + nCoefs;
    if (k < nhalf + 2) { // Simplify condition
        cepstrum[k] = 0.0f; // Use float literal
    }
}