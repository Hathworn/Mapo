#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void myhistKernel(unsigned char * buffer,unsigned int * histo)
{
    __shared__ unsigned int temp[256];

    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Initialize shared memory only for relevant threads
    if (threadIdx.x < 256) {
        temp[threadIdx.x] = 0;
    }
    __syncthreads();

    // Check the range before atomicAdd in shared memory
    if (offset < blockDim.x * blockDim.y * gridDim.x * gridDim.y) {
        atomicAdd(&temp[buffer[offset]], 1);
    }
    __syncthreads();

    // Use only 256 threads for the final write-back to global memory
    if (threadIdx.x < 256) {
        atomicAdd(&(histo[threadIdx.x]), temp[threadIdx.x]);
    }
}