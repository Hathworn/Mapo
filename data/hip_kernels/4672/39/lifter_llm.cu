#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lifter(float* cepstrum, int nCoefs, int nhalf) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int k = i + nCoefs;
    if (k < nhalf + 2 - nCoefs) {
        // Set to zero for coefficients above nCoefs
        cepstrum[k] = 0.0f;
    }
}