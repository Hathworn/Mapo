#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void takeLog(float* input, float* env, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < nhalf) {
        int j = i << 1;
        // Use fmaxf to ensure input[j] is not less than 1e-20 before taking log
        env[i] = logf(fmaxf(input[j], 1e-20f)); 
    }
}