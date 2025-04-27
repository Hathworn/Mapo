#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lifter(float* cepstrum, int nCoefs, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;

    // Calculate k once and reuse.
    int k = i + nCoefs;
    
    // Bounds checking to avoid out-of-bound access
    if (k < nhalf + 2 - nCoefs) {
        cepstrum[k] = 0.0; // Efficiently kill all the cepstrum coefficients above nCoefs
    }
}