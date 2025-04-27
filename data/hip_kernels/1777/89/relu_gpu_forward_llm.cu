#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Calculate stride for all threads
    for (int i = tid; i < N; i += stride) {  // Loop with stride to process all elements
        out[i] = in[i] > 0 ? in[i] : 0;  // Simplified relu operation
    }
}