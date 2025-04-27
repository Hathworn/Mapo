#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_copyPredictorTo32Shift(int32_t * in, uint16_t * shift, int32_t * out, uint32_t stride, uint32_t * numSamples, int32_t bytesShifted, int32_t theOutputPacketBytes, uint32_t frameLength)
{
    int block = blockIdx.x % 8;
    int index = blockIdx.x / 8;
    int z = threadIdx.x + block * blockDim.x;

    // Precompute commonly used values outside condition block
    int32_t shiftVal = bytesShifted * 8;
    int32_t * op = out + (index * theOutputPacketBytes) / 4 + stride * z;
    
    if (z < numSamples[index])
    {
        // Use local variable to reduce redundant calculations
        const int32_t * in_offset = in + index * frameLength;
        const uint16_t * shift_offset = shift + index * frameLength * 2;
        
        op[0] = (in_offset[z] << shiftVal) | (uint32_t)shift_offset[z];
    }
}