#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use cooperative thread group stride to cover all elements
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        ingrad[i] = indata[i] > 0 ? outgrad[i] : 0;
    }
}