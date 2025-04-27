#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    // Cache the thread ID for reuse
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Streamline condition check and assignment
    if (tid < N) {
        float data = indata[tid];
        ingrad[tid] = (data > 0) ? outgrad[tid] : 0;
    }
}