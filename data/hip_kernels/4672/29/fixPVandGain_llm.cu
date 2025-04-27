#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fixPVandGain(float* input, float* output, float gain, int length) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = i << 1;

    // Unroll loop for better performance
    if (j + 1 < length) {
        float out_j = output[j];
        float out_j1 = output[j + 1];

        // Optimize NaN check with combined conditions
        if (isnan(out_j) || out_j1 == -1.0f) {
            output[j] = 0.0f;  // set to zero any invalid or undefined amplitude
        } else {
            output[j] *= gain;  // scale valid amplitudes by the gain factor
        }
    }

    // Maintain boundary conditions outside loop
    if (j == 0) {
        output[0] = input[0];  // keep original DC amplitude
    }
    if (j == length - 2) {
        output[length - 2] = input[length - 2];  // keep original Nyquist amplitude
    }
}