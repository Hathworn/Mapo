#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fixPVandGain(float* input, float* output, float gain, int lowestIndx, int length) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = i << 1;
    
    // Use early return to reduce unnecessary checks and improve performance
    if (j < lowestIndx || j >= length) return;

    // Replace isnan with fpclassify for potential performance gain
    if (__builtin_fpclassify(FP_NAN, FP_INFINITE, FP_NORMAL, FP_SUBNORMAL, FP_ZERO, output[j]) == FP_NAN) 
        output[j] = 0.0f;  // Set to zero any invalid amplitude

    if (output[j+1] == -1.0f) 
        output[j] = 0.0f;  // Set to zero the amp related to any undefined frequency
    else
        output[j] *= gain;  // Scale all amplitudes by the gain factor

    if (j == 0) output[0] = input[0];  // Keep original DC amplitude
    if (j == length-2) output[length-2] = input[length-2];  // Keep original Nyquist amplitude
}