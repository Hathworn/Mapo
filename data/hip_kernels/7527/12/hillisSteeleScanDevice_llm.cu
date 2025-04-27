#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hillisSteeleScanDevice(int *d_predicateArray, int d_numberOfElements, int *d_tmpArray, int d_offset)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index < d_numberOfElements) 
    {
        // Direct access to prevent re-fetching and reduce memory reads
        int currentVal = d_predicateArray[index];
        d_tmpArray[index] = currentVal;
        
        // Use shared memory for temporary storage, reduces access time
        __shared__ int sharedData[BLOCK_SIZE];
        sharedData[threadIdx.x] = currentVal;
        __syncthreads();

        if (index - d_offset >= 0) 
        {
            // Improved memory access patterns
            int offsetVal = (threadIdx.x >= d_offset) ? sharedData[threadIdx.x - d_offset] : d_predicateArray[index - d_offset];
            d_tmpArray[index] = currentVal + offsetVal;
        }
    }
}