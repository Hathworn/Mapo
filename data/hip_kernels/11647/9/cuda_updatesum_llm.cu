#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_updatesum(int *array, int *update_array, int size)
{
    extern __shared__ int shared[];

    unsigned int tid = threadIdx.x;
    unsigned int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load previous block sum into a register for faster access
    int op = (blockIdx.x > 0) ? update_array[blockIdx.x - 1] : 0;

    // Avoid out-of-bounds access
    if (id < size) {
        shared[tid] = array[id] + op;
        __syncthreads(); // Ensure all threads have written to shared memory
        array[id] = shared[tid];
    }
}