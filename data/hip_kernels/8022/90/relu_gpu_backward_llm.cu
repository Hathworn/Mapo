#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Process the elements using multiple threads in parallel
    for (int idx = tid; idx < N; idx += blockDim.x * gridDim.x) {
        ingrad[idx] = indata[idx] > 0 ? outgrad[idx] : 0;
    }
}