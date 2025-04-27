#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scatterKernel(const unsigned int *d_In, const unsigned int *d_FalseKeyAddresses, unsigned int *d_Out, const unsigned int totalFalses, size_t size, unsigned int bitPos)
{
    // Calculate unique thread index for this execution thread
    int myId = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread operates only within data size
    if (myId < size)
    {
        // Read false key address efficiently using local variable
        unsigned int myFalseKeyAddress = d_FalseKeyAddresses[myId];

        // Calculate true sort key address directly using thread index calculations
        int trueSortKeyAddress = myId - myFalseKeyAddress + totalFalses;

        // Determine if key is true or false using shift and mask
        unsigned int trueSortKey = (d_In[myId] >> bitPos) & 0x1;

        // Utilize conditional to compute destination address
        int destinationAddress = trueSortKey ? trueSortKeyAddress : myFalseKeyAddress;

        // Write sorted data to output in reduced latency format
        d_Out[destinationAddress] = d_In[myId];
    }
}