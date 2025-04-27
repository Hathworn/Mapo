#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_kernel(int n, float a, float *v1, float *v2, float *s) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for coalesced global memory access
    __shared__ float s_v1[256];

    if (i < n) {
        // Load v1 data into shared memory
        s_v1[threadIdx.x] = v1[i];
        __syncthreads();

        // Perform computation using shared memory
        s[i] = a * s_v1[threadIdx.x] + v2[i];
    }
}