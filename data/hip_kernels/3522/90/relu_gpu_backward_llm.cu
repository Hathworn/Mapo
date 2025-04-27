#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    // Utilizing shared memory to reduce global memory traffic
    extern __shared__ float shared_indata[];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    // Load data into shared memory
    if (tid < N) {
        shared_indata[local_tid] = indata[tid];
    }
    __syncthreads();

    // Perform computation using shared memory
    if (tid < N) {
        ingrad[tid] = shared_indata[local_tid] > 0 ? outgrad[tid] : 0;
    }
}