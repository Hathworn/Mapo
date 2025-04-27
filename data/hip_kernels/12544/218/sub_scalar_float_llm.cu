#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sub_scalar_float(int n, int idx, float dx, float *dy, int incy, float *result) {
    // Use shared memory to reduce memory latency
    __shared__ float shared_dy[256]; // Assuming blockDim.x is 256
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop with stride and cache the data in shared memory
    for (int i = tid; i < n; i += blockDim.x * gridDim.x) {
        if (i >= idx && i % incy == 0) {
            shared_dy[threadIdx.x] = dy[i];
            __syncthreads();
            result[i] = shared_dy[threadIdx.x] - dx;
            __syncthreads();
        }
    }
}