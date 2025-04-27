#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    // Use shared memory for faster access
    extern __shared__ float s_indata[];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int lane = threadIdx.x;

    // Load data into shared memory
    if (tid < N) {
        s_indata[lane] = indata[tid];
        __syncthreads(); // Synchronize to ensure all data is loaded

        // Efficient calculation with shared memory
        ingrad[tid] = s_indata[lane] > 0 ? outgrad[tid] : 0;
    }
}