#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void lifter(float* cepstrum, int nCoefs, int nhalf) {
    // Improved thread index calculation for efficiency
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int k = i + nCoefs;
    
    // Optimized boundary check using ternary operator
    cepstrum[k] = (k < nhalf + 2 - nCoefs) ? 0.0f : cepstrum[k];
}