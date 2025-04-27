#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void encryptKernel(char* deviceDataIn, char* deviceDataOut, int n) {
    unsigned index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory accesses
    __shared__ char sharedData[blockDim.x];
  
    if (index < n) {
        sharedData[threadIdx.x] = deviceDataIn[index];
        __syncthreads();
        deviceDataOut[index] = sharedData[threadIdx.x] + 1;
    }
}