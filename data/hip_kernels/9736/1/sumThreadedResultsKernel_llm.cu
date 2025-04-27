#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumThreadedResultsKernel(long *dev_hist, int *dev_threadedHist, const int valRange, const int Blocks)
{
    int tid = threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Calculate grid stride

    // Use strided loop for coalesced memory access
    for (int i = tid; i < valRange; i += stride)
    {
        long sum = 0;  // Temporary variable to reduce global memory access
        for (int bl = 0; bl < Blocks; bl++)
        {
            sum += dev_threadedHist[bl * valRange + i];
        }
        dev_hist[i] += sum;
    }
}
```
