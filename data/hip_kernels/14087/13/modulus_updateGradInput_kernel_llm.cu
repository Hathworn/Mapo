#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void modulus_updateGradInput_kernel(float* input, float* output, float* gradInput, float* gradOutput, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Thread boundary condition
    if (i < n) {
        const float eps = 0.0001;
        const float c = gradOutput[i] / max(output[i], eps);
        
        // Vectorized memory access
        gradInput[i * 2] = input[i * 2] * c;
        gradInput[i * 2 + 1] = input[i * 2 + 1] * c;
    }
}