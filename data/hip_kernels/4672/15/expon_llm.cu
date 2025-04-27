#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void expon(float* env, int nhalf) {
    // Calculate the global index based on the thread and block indices
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check condition to avoid out-of-bound memory access
    if (i < nhalf) {
        // Use device-specific expf function for single precision
        env[i] = expf(env[i] / nhalf);  // exponentiate
    }
}