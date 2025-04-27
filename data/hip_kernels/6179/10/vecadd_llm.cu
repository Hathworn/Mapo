#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float in1[1000];
__device__ __constant__ float in2[1000];

__global__ void vecadd(float* out, int N) {
    // Calculate the global index
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure index is within bounds before accessing arrays
    if (idx < N) {
        out[idx] = in1[idx] + in2[idx];
    }
}

__global__ void vecadd(float* in1, float* in2, float* out, int N) {
    // Calculate the global index
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure index is within bounds before accessing arrays
    if (idx < N) {
        out[idx] = in1[idx] + in2[idx];
    }
}