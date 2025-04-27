#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fixPVandGain(float* output, float gain, int length) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = i << 1;
    if (j < length) {
        // Replace isnan with inline check to reduce function call overhead
        if (!(output[j] == output[j])) // Check for NaN
            output[j] = 0.0f; // Set to zero any invalid amplitude

        float freq = output[j + 1];
        if (freq == -1.0f) { // Check for undefined frequency
            output[j] = 0.0f; // Set to zero the amp related to any undefined frequency
        } else {
            output[j] *= gain; // Scale all amplitudes by the gain factor
        }
    }
}