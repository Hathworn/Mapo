#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, const float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Check and assign in a single operation
    if (tid < N) {
        float val = in[tid];
        out[tid] = fmaxf(val, 0.0f);  // Use fmaxf for better readability and potential performance
    }
}