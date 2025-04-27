#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel with improved memory coalescing and simplified computation
__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a loop to handle cases where total threads can be greater than N
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        ingrad[i] = indata[i] > 0 ? outgrad[i] : 0;
    }
}