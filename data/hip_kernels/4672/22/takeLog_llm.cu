#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void takeLog(float* input, float* env, int nhalf) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure i is within valid range
    if (i < nhalf) {
        int j = i << 1; // Use bit shift for multiplication by 2
        float amplitude = input[j];
        // Use fmax to ensure amplitude is greater than 0
        env[i] = logf(fmaxf(amplitude, 1e-20f)); // Use logf for faster calculations
    }
}