#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fixPVandGain(float* output, float gain, int length) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = i << 1;
    
    // Check boundaries first to avoid unnecessary calculations
    if (j < length) {
        float val_j = output[j];
        float val_j1 = output[j+1];

        // Combine logical checks to minimize divergence
        if (!isnan(val_j) && val_j1 != -1.0f) {
            output[j] *= gain; // scale if both checks pass
        } else {
            output[j] = 0.0f; // set to zero for invalid or undefined conditions
        }
    }
}