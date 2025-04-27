#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fixPVandGain(float* output, float gain, int length) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = i << 1;
    if (j < length) {
        float val = output[j];
        float freq = output[j+1];
        if (isnan(val) || freq == -1.0f) { // Combine checks to reduce branching
            output[j] = 0.0f;  // Set to zero for invalid conditions
        } else {
            output[j] *= gain; // Scale amplitudes by gain factor
        }
    }
}