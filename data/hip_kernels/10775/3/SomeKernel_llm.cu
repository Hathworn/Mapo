#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SomeKernel(int* res, int* data, int col, int row, int y, int step)
{
    unsigned int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate a per-thread starting column
    int startCol = step * threadId;
    int endCol = min((threadId + 1) * step, col);

    for (int i = startCol; i < endCol; i++) // Iterate over assigned columns
    {
        int lastValue = data[i + y * row]; // Cache last value to avoid redundant loads
        for (int j = y; j > 0; j--) 
        {
            int currValue = data[i + (j - 1) * row];
            int currDelta = lastValue - currValue;
            // Cache to avoid redundant multiplication
            int absDelta = currDelta >= 0 ? currDelta : -currDelta; 
            if (absDelta > 10) 
            {
                res[i] = j - 1;
                break;
            }
            lastValue = currValue; // Update lastValue for next iteration
        }
    }
}