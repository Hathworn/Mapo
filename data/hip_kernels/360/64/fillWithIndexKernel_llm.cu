#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fillWithIndexKernel(int size, int *array)
{
    // Use shared memory for faster access
    extern __shared__ int sharedArray[];

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if(idx < size)
    {
        // Copy data to shared memory
        sharedArray[threadIdx.x] = idx; 
        
        // Sync threads before copying back to global memory
        __syncthreads();

        // Write back from shared memory
        array[idx] = sharedArray[threadIdx.x];
    }
}