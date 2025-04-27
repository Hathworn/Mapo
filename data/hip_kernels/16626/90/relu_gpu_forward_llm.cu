#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Calculate the global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use loop unrolling to process multiple elements per thread if applicable
    int stride = blockDim.x * gridDim.x;
    for (int i = tid; i < N; i += stride) {
        // Optimize the conditional operation using max function
        out[i] = max(in[i], 0.0f);
    }
}