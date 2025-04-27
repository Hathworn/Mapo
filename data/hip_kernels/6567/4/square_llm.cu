#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(int *array, int arrayCount)
{
    // Use shared memory to increase cache efficiency
    extern __shared__ int sharedArray[];
    
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int localIdx = threadIdx.x;
    
    if (idx < arrayCount) {
        // Load from global to shared memory
        sharedArray[localIdx] = array[idx];
        __syncthreads();
        
        // Perform computation in shared memory
        sharedArray[localIdx] *= sharedArray[localIdx];
        __syncthreads();
        
        // Store results back to global memory
        array[idx] = sharedArray[localIdx];
    }
}