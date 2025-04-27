#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

__global__ void u8_to_one_hot_f32(const unsigned char* x, unsigned int nclasses, float* y, unsigned int len) {
    // Use shared memory to reduce global memory access latency
    extern __shared__ unsigned char x_shared[];
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Each thread copies relevant data to shared memory
    if (tid < len) {
        x_shared[threadIdx.x] = x[tid];
        __syncthreads(); // Synchronize to ensure all data is copied
        
        // Calculate index based on shared memory and set value
        y[tid * nclasses + x_shared[threadIdx.x]] = 1.0f;
    }
}