#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getValue(float *outdata, float *indata) {
    // Use shared memory to reduce global memory access latency
    __shared__ float sharedData;
    if (threadIdx.x == 0) {
        sharedData = indata[0]; // Load data into shared memory by the first thread
    }
    __syncthreads(); // Ensure shared memory is loaded before use
    
    if (threadIdx.x == 0) {
        outdata[0] = sharedData + 3.0f; // Use shared memory data
    }
}