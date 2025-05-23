#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_mix20_1(uint8_t * ip, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples, int32_t mixres, int32_t m2, int32_t mixbits)
{
    int z = threadIdx.x + blockIdx.x * blockDim.x;
    // Ensure Z is within valid range
    if (z < numSamples)
    {
        int32_t l, r;

        // Efficient pointer arithmetic for accessing elements
        uint8_t* ipOffset = ip + z * (3 + (stride - 1) * 3);

        l = (int32_t((((uint32_t)ipOffset[HBYTE] << 16) | ((uint32_t)ipOffset[MBYTE] << 8) | (uint32_t)ipOffset[LBYTE])) << 8) >> 12;
        
        ipOffset += 3;
        
        r = (int32_t((((uint32_t)ipOffset[HBYTE] << 16) | ((uint32_t)ipOffset[MBYTE] << 8) | (uint32_t)ipOffset[LBYTE])) << 8) >> 12;

        // Optimize calculations by storing results directly in the memory
        u[z] = (mixres * l + m2 * r) >> mixbits;
        v[z] = l - r;
    }
}