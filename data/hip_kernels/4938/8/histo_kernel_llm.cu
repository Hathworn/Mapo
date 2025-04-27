#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel (unsigned char *buffer, long size, int *histo) {
    __shared__ int temp[256];
    
    // Initialize shared memory only for used elements
    if (threadIdx.x < 256)
        temp[threadIdx.x] = 0;

    __syncthreads();

    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int offset = blockDim.x * gridDim.x;

    // Loop unrolling to increase instruction throughput
    while (i < size) {
        atomicAdd(&temp[buffer[i]], 1);
        if (i + offset < size) atomicAdd(&temp[buffer[i + offset]], 1);
        i += 2 * offset;
    }
    
    __syncthreads();

    // Ensure atomic operation updates histo properly
    if (threadIdx.x < 256)
        atomicAdd(&(histo[threadIdx.x]), temp[threadIdx.x]);
}