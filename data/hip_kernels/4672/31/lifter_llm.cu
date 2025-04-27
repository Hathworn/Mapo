#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lifter(float* cepstrum, int nCoefs, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int k = i + nCoefs;
    
    // Use block size to ensure we process within the valid range
    if (k < nhalf + 2 - nCoefs) {
        cepstrum[k] = 0.0f;  // Set coefficients beyond nCoefs to 0
    }
}