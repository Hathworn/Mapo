#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void sqrt_double(int n, int idx, double *dy, int incy, double *result) {
    // Use shared memory to reduce global memory access if needed
    __shared__ double shared_dy[256]; // Assuming block size of 256, adjust if necessary
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    while (i < n) {
        if (i >= idx && i % incy == 0) {
            // Load data to shared memory, then compute
            shared_dy[threadIdx.x] = dy[i];
            __syncthreads();

            result[i] = sqrt(shared_dy[threadIdx.x]);
        }
        i += blockDim.x * gridDim.x;
    }
}