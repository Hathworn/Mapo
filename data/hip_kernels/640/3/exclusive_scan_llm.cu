#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void exclusive_scan(unsigned int *in, unsigned int *out, int n)
{
    // Use shared memory for increased access speed
    __shared__ unsigned int temp[256]; // Assume blockDim.x <= 256
    
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < n)
    {
        // Load input into shared memory
        temp[threadIdx.x] = in[i];
        
        __syncthreads(); // Ensure all threads have written
        
        // Perform exclusive scan in shared memory
        unsigned int offset = 1;
        while (offset < blockDim.x)
        {
            if (threadIdx.x >= offset)
            {
                temp[threadIdx.x] += temp[threadIdx.x - offset];
            }
            __syncthreads(); // Synchronize after each iteration
            
            offset <<= 1; // Double the offset
        }
        
        if (threadIdx.x == 0)
        {
            temp[0] = 0; // Ensure first element is zero for exclusive scan
        }
        
        __syncthreads(); // Final synchronization
        
        out[i] = temp[threadIdx.x]; // Write scan result to global memory
    }
}