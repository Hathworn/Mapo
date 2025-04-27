#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for faster access
    extern __shared__ float data[];
    data[threadIdx.x] = indata[tid];
    __syncthreads();

    if (tid < N) {
        // Simplified conditional assignment
        ingrad[tid] = (data[threadIdx.x] > 0) * outgrad[tid];
    }
}