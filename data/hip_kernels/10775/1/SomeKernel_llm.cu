#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SomeKernel(int* res, int* data, int col, int row, int y, int step)
{
    // Calculate thread identifier
    unsigned int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    int currDelta = 0;

    // Iterate columns for each thread
    for (int i = step * threadId; (i < (threadId + 1) * step) && (i < col); i++) {
        // Iterate through rows, from y down to 1
        for (int j = y; j > 0; j--) {
            // Calculate current delta
            currDelta = data[i + j * row] - data[i + (j - 1) * row];

            // Determine magnitude and check threshold
            if (abs(currDelta) > 10) {
                res[i] = j - 1;
                break; // Stop further row processing for this column
            }
        }
    }
}