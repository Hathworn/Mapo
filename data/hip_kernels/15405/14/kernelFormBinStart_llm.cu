#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFormBinStart(int* devOutputBinStart, unsigned int* devInputBinCirPairBin, unsigned int bcPairLen)
{
    // Declare shared memory with a dynamic size to fit the block size
    extern __shared__ int cache[];

    int bcPairIdx = blockDim.x * blockIdx.x + threadIdx.x;

    if (bcPairIdx >= bcPairLen)
    {
        return;
    }

    // Load current bin pair values into shared memory
    cache[threadIdx.x + 1] = devInputBinCirPairBin[bcPairIdx];

    // Handle the first thread storing the last bin of the previous block
    if (threadIdx.x == 0)
    {
        if (bcPairIdx != 0)
        {
            cache[0] = devInputBinCirPairBin[bcPairIdx - 1];
        }
        else
        {
            cache[0] = -1;
        }
    }

    __syncthreads();

    // Check for transition and update output based on it
    if (threadIdx.x == 0 || cache[threadIdx.x + 1] != cache[threadIdx.x])
    {
        devOutputBinStart[cache[threadIdx.x + 1]] = bcPairIdx;
    }
}