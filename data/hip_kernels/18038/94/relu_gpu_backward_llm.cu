#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use loop to ensure all threads participate and process multiple elements
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        ingrad[i] = indata[i] > 0 ? outgrad[i] : 0; // Simplify condition and calculation
    }
}