#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void morph(float* output, float* input1, float* input2, float ampCoeff, float freqCoeff, int length) {
    int i = (blockIdx.x * blockDim.x + threadIdx.x) << 1; // Combine index calculation
    if (i < length) {
        float amp = 1.0 - ampCoeff;  // Pre-calculate coefficients
        float freq = 1.0 - freqCoeff;
        
        // Load input values into registers for faster access
        float in1_0 = input1[i]; 
        float in1_1 = input1[i + 1];
        float in2_0 = input2[i];
        float in2_1 = input2[i + 1];
        
        // Compute output using pre-calculated coefficients
        output[i] = in1_0 * amp + in2_0 * ampCoeff;
        output[i + 1] = in1_1 * freq + in2_1 * freqCoeff;
    }
}