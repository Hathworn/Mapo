#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_unique_thread_id_1D()
{
    // Calculate unique thread ID using 1D grid and block indices
    int tid = blockIdx.x * blockDim.x + threadIdx.x; 

    // Use a more efficient conditional check to print only if this thread is active
    if (tid < gridDim.x * blockDim.x) {
        printf("Thread{%d,%d,%d}, Block{%d,%d,%d}, tid{%d}\n", 
               threadIdx.x, threadIdx.y, threadIdx.z, 
               blockIdx.x, blockIdx.y, blockIdx.z, 
               tid);
    }
}