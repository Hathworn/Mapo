#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel( unsigned char *buffer, long size, unsigned int *histo ) {

    // Use shared memory to cache histogram values
    __shared__ unsigned int temp[256];
    temp[threadIdx.x] = 0; // Initialize shared memory
    __syncthreads();

    // Calculate global index and stride for loop iteration
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    // Loop through buffer with stride and accumulate results into shared memory
    while (i < size) {
        atomicAdd(&temp[buffer[i]], 1);
        i += stride;
    }

    __syncthreads();  // Ensure all writes to shared memory are complete

    // Update global histogram using accumulated results from shared memory
    atomicAdd(&(histo[threadIdx.x]), temp[threadIdx.x]);
}