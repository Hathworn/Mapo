#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_copyPredictorTo16(int32_t *in, int16_t *out, uint32_t stride, uint32_t *numSamples, int32_t theOutputPacketBytes, uint32_t frameLength)
{
    // Improved memory coalescing by calculating block and index using blockIdx.x and blockIdx.y
    int block = threadIdx.x + (blockIdx.x % 8 * blockDim.x);
    int index = blockIdx.x / 8;
    
    if (block < numSamples[index])
    {
        int16_t *op = out + (index * theOutputPacketBytes) / 2;
        
        // Efficient access pattern for global memory
        op[block] = static_cast<int16_t>(in[index * frameLength + block]);
    }
}