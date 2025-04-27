#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void segCountSum_shared(int *counter, int *segcounter, const int countlength)
{
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;
    extern __shared__ int s_counter[];

    // Initialize shared memory only for valid indices
    if (xIndex < countlength) {
        s_counter[xIndex] = 0; // Initialize shared memory to 0
        
        // Use a single loop with stride to improve memory access pattern
        for (int jj = xIndex; jj < countlength * countlength; jj += countlength) {
            s_counter[xIndex] += segcounter[jj];
        }
        
        // Write the result back to global memory
        counter[xIndex] = s_counter[xIndex];
    }
}