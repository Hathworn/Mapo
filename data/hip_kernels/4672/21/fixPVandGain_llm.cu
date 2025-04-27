#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fixPVandGain(float* output, float gain, int lowestIndx, int length) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = i << 1;

    if (j >= lowestIndx && j < length) {
        float amplitude = output[j];
        if (__builtin_isnan(amplitude)) {  // Use intrinsic function for better performance
            amplitude = 0.0f;  // set to zero any invalid amplitude
        } else if (output[j + 1] == -1.0f) {
            amplitude = 0.0f;  // set to zero the amp related to any undefined frequency
        } else {
            amplitude *= gain;  // scale all amplitudes by the gain factor
        }
        output[j] = amplitude;  // Ensure output update outside of conditional logic
    }
}