#include "hip/hip_runtime.h"
#include "includes.h"

#define block_count 32
#define thread_per_block 1024

// Optimized kernel
__global__ void GEMMLowpKernel(const float* __restrict__ in, const int N, float* __restrict__ out, float scale, float shift, long long qmax, const float* __restrict__ noise, bool enforce_true_zero) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread operates within bounds
    if (i < N) {
        // Load input with noise
        float temp_out = in[i] + noise[i];
        // Conditionally scale and shift
        if (enforce_true_zero) {
            temp_out = (temp_out / scale) + shift;
        } else {
            temp_out = (temp_out + shift) / scale;
        }
        // Clip and round value
        temp_out = fminf(fmaxf(roundf(temp_out), 0.0f), static_cast<float>(qmax));
        // Conditionally revert scaling and shifting
        if (enforce_true_zero) {
            out[i] = (temp_out - shift) * scale;
        } else {
            out[i] = temp_out * scale - shift;
        }
    }
}