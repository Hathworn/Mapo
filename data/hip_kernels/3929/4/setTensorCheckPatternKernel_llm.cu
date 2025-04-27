#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setTensorCheckPatternKernel(unsigned int* data, unsigned int ndata) {
    // Use shared memory to reduce global memory accesses
    __shared__ unsigned int sharedData[256]; // Adjust size as needed

    unsigned int globalIdx = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (globalIdx < ndata) {
        // Load data to shared memory
        sharedData[threadIdx.x] = globalIdx;
        __syncthreads();

        // Store data back to global memory
        data[globalIdx] = sharedData[threadIdx.x];
    }
}