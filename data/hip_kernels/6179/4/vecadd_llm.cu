#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float in1[1000];
__device__ __constant__ float in2[1000];

__global__ void vecadd(float *out, int N) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if (idx < N) {
        // Reduce global memory loads by using shared memory
        extern __shared__ float shared_in2[];
        if (threadIdx.x < 1000) {
            shared_in2[threadIdx.x] = in2[threadIdx.x];
        }
        __syncthreads();
        out[idx] = in1[idx] + shared_in2[idx];
    }
}

__global__ void vecadd(float *in1, float *in2, float *out, int N) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if (idx < N) {
        // Combine memory load and addition into one operation to reduce latency
        out[idx] = in1[idx] + in2[idx];
    }
}