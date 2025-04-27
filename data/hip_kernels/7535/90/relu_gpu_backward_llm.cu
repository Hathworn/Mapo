#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use loop unrolling and shared memory to improve memory access efficiency
    __shared__ float s_outgrad[256];
    __shared__ float s_indata[256];

    if (tid < N) {
        s_outgrad[threadIdx.x] = outgrad[tid];
        s_indata[threadIdx.x] = indata[tid];

        __syncthreads();

        ingrad[tid] = s_indata[threadIdx.x] > 0 ? s_outgrad[threadIdx.x] : 0;
    }
}