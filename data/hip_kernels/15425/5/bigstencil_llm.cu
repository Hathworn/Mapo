#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bigstencil(int* in, int* out) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to improve memory access speed
    __shared__ int sharedIn[256]; // Assuming blockDim.x is 256, adjust if different

    // Load input into shared memory
    sharedIn[threadIdx.x] = in[i];
    __syncthreads();

    // Perform computation using shared memory
    out[i] = sharedIn[threadIdx.x] + 2;
}