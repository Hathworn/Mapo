#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void morph(float* output, float* input1, float* input2, float ampCoeff, float freqCoeff, int length) {
    int j = (threadIdx.x + blockIdx.x * blockDim.x) << 1;
    // Optimize the condition check by moving it to an earlier stage
    if (j < length) {
        float ampCoeffComp = 1.0f - ampCoeff;
        float freqCoeffComp = 1.0f - freqCoeff;
        // Reduce redundant computations
        output[j] = input1[j] * ampCoeffComp + input2[j] * ampCoeff;
        output[j + 1] = input1[j + 1] * freqCoeffComp + input2[j + 1] * freqCoeff;
    }
}