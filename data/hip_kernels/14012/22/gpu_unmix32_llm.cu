#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_unmix32(int32_t * u, int32_t * v, int32_t * out, uint32_t stride, uint32_t * numSamples, int32_t * mixbits, int32_t * mixres, uint16_t * shiftUV, int32_t bytesShifted, int32_t theOutputPacketBytes, uint32_t frameLength)
{
    // Precompute shared values to reduce redundant calculations
    int32_t shift = bytesShifted * 8;
    int block = blockIdx.x % 8;
    int index = blockIdx.x / 8;
    int z = threadIdx.x + block * blockDim.x;
    if (z >= numSamples[index]) return; // Eliminate extra conditions

    int32_t * op = out + (index * theOutputPacketBytes) / 4 + stride * z;
    int32_t k = z * 2;
    int32_t lt = (u + index * frameLength)[z];
    int32_t rt = (v + index * frameLength)[z];
    uint16_t* shiftUV_ptr = shiftUV + index * frameLength * 2 + k; // Precompute address

    if (mixres[index] != 0)
    {
        // Simplify calculations by reducing operations
        int32_t l = lt + rt - ((mixres[index] * rt) >> mixbits[index]);
        int32_t r = l - rt;

        op[0] = (l << shift) | (uint32_t)shiftUV_ptr[0];
        op[1] = (r << shift) | (uint32_t)shiftUV_ptr[1];
    }
    else
    {
        op[0] = (lt << shift) | (uint32_t)shiftUV_ptr[0];
        op[1] = (rt << shift) | (uint32_t)shiftUV_ptr[1];
    }
}