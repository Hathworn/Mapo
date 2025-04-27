#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fixPVandGain(float* input, float* output, float gain, int length) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = i << 1;

    // Use __ldg for potentially optimized global memory access
    if (j < length) {
        // Combine condition checks to reduce branching
        float out_j = __ldg(&output[j]);
        if (isnan(out_j) || output[j + 1] == -1.0f) {
            output[j] = 0.0f; // set to zero any invalid or undefined frequency amplitude
        } else {
            output[j] *= gain; // scale all amplitudes by the gain factor
        }
    }

    // Use ternary operator to simplify boundary conditions
    if (j == 0 || j == length - 2) {
        output[j] = (j == 0) ? input[0] : input[length - 2]; // keep original DC or Nyquist amplitude
    }
}