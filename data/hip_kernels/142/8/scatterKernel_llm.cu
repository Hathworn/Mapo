#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scatterKernel(const unsigned int *d_In, const unsigned int *d_InPos, const unsigned int *d_FalseKeyAddresses, unsigned int *d_Out, unsigned int *d_OutPos, const unsigned int totalFalses, size_t size, unsigned int bitPos)
{
    // Optimize thread calculation using flat block index
    int myId = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within bounds
    if (myId < size)
    {
        unsigned int _myFalseKeyAddress = d_FalseKeyAddresses[myId];

        // Calculate true sort key address
        int _trueSortKeyAddress = myId - _myFalseKeyAddress + totalFalses;

        // True sort key?
        unsigned int _trueSortKey = (d_In[myId] >> bitPos) & 0x1;

        // Ternary operator for destination address
        int _destinationAddress = _trueSortKey ? _trueSortKeyAddress : _myFalseKeyAddress;

        // Directly set values in output arrays
        d_Out[_destinationAddress] = d_In[myId];
        d_OutPos[_destinationAddress] = d_InPos[myId];
    }
}