#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(int *out, int N) {
    // Utilize shared memory for the computation
    extern __shared__ int sharedOut[];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < N) {
        sharedOut[threadIdx.x] = 0;
        __syncthreads();
        out[tid] = sharedOut[threadIdx.x];
    }
}