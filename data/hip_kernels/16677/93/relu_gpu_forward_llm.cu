#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use loop unrolling for better performance
    int stride = blockDim.x * gridDim.x;
    for (int i = tid; i < N; i += stride) {
        out[i] = in[i] > 0 ? in[i] : 0;
    }
}