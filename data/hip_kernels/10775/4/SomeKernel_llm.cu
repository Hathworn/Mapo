#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SomeKernel(int* res, int* data, int col, int row, int y, int step)
{
    unsigned int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for better performance when accessing data array
    extern __shared__ int sharedData[];
    
    // Load data into shared memory
    for (int i = threadId * step; i < (threadId + 1) * step && i < col; ++i) {
        sharedData[i] = data[i];
    }
    __syncthreads();
    
    int currDelta = 0;
    for (int i = step * threadId; (i < (threadId + 1) * step) && (i < col); i++) {
        for (int j = y; j > 0; --j) {
            currDelta = sharedData[i + j * row] - sharedData[i + (j - 1) * row];
            // Calculate abs(currDelta) without ternary operator
            if (abs(currDelta) > 10) {
                res[i] = j - 1;
                break;
            }
        }
    }
}
```
