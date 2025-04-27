#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    // Utilize shared memory for potential performance improvement
    __shared__ float shared_outgrad[256];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Load outgrad into shared memory (assuming blockDim.x is 256)
    if (threadIdx.x < 256)
        shared_outgrad[threadIdx.x] = outgrad[tid];

    __syncthreads();

    // Only access shared memory within valid indices
    if (tid < N)
        ingrad[tid] = indata[tid] > 0 ? shared_outgrad[threadIdx.x] : 0;
}