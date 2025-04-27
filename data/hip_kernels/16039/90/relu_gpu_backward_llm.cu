#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    // Calculate thread id
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use memory coalescing and boundary check
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        ingrad[i] = indata[i] > 0 ? outgrad[i] : 0;
    }
}