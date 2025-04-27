#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFlou(unsigned char * ptr, unsigned int * debug)
{
    __shared__ char sum[4];

    // Initialize shared memory to zero using a loop to reduce code redundancy
    for (int i=0; i<4; i++) {
        sum[i] = 0;
    }

    int x = blockIdx.x;
    int y = blockIdx.y;
    int cc = threadIdx.z;

    int index_ptr = (x * DIM_2 + threadIdx.x + (y * DIM_2 + threadIdx.y) * (gridDim.x * DIM_2)) * 4;
    int index_avg = (x + y * gridDim.x) * 4;

    __syncthreads();

    // Atomic addition for safe concurrent updates of shared memory
    atomicAdd(&sum[cc], ptr[index_ptr + cc] / (DIM_2 * DIM_2));

    __syncthreads();

    ptr[index_ptr + cc] = sum[cc];
    debug[index_avg + cc] = sum[cc];
}