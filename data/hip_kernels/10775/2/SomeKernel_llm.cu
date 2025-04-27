#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SomeKernel(int* res, int* data, int col, int row, int y, int step)
{
    unsigned int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Using shared memory to reduce global memory access
    extern __shared__ int sharedData[];

    for (int i = step * threadId; (i < (threadId + 1) * step) && (i < col); i++) 
    {
        // Load column data into shared memory
        for (int j = 0; j <= y; j++) {
            sharedData[j] = data[i + j * row];
        }
        __syncthreads(); // Ensure all data is loaded before proceeding

        for (int j = y; j > 0; j--) 
        {
            int currDelta = sharedData[j] - sharedData[j - 1];
            // Use absolute difference
            if (abs(currDelta) > 10) {
                res[i] = j - 1;
                break;
            }
        }
    }
}