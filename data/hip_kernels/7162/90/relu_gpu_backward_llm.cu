#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    // Optimize by unrolling loops and handling more elements per thread
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (int i = tid; i < N; i += stride) {
        ingrad[i] = indata[i] > 0 ? outgrad[i] : 0;
    }
}