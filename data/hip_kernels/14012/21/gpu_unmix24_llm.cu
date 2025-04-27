#include "hip/hip_runtime.h"
#include "includes.h"

// Define macros for byte offsets
#define HBYTE 0
#define MBYTE 1
#define LBYTE 2

__global__ void gpu_unmix24(int32_t *u, int32_t *v, uint8_t *out, uint32_t stride, uint32_t *numSamples, int32_t *mixbits, int32_t *mixres, uint16_t *shiftUV, int32_t bytesShifted, int32_t theOutputPacketBytes, uint32_t frameLength)
{
    int block = blockIdx.x % 8;
    int index = blockIdx.x / 8;
    int z = threadIdx.x + block * blockDim.x;

    if (z < numSamples[index])
    {
        int32_t shift = bytesShifted * 8;
        int32_t l, r;
        int32_t k = z * 2;
        uint8_t *op = out + (index * theOutputPacketBytes);
        int32_t uVal = (u + index * frameLength)[z];
        int32_t vVal = (v + index * frameLength)[z];
        uint16_t shiftUVValue1 = (shiftUV + index * frameLength * 2)[k + 0];
        uint16_t shiftUVValue2 = (shiftUV + index * frameLength * 2)[k + 1];

        if (mixres[index] != 0)
        {
            // optimized calculation for matrixed stereo
            int32_t temp = (mixres[index] * vVal) >> mixbits[index];
            l = uVal + vVal - temp;
            r = l - vVal;
        }
        else
        {
            // optimized calculation for conventional separated stereo
            l = uVal;
            r = vVal;
        }

        l = (l << shift) | shiftUVValue1;
        r = (r << shift) | shiftUVValue2;

        // Use efficient memory addressing and assignments
        op += (stride + 1) * 3 * z; 
        op[HBYTE] = (uint8_t)((l >> 16) & 0xffu);
        op[MBYTE] = (uint8_t)((l >> 8) & 0xffu);
        op[LBYTE] = (uint8_t)((l >> 0) & 0xffu);
        op += 3;

        op[HBYTE] = (uint8_t)((r >> 16) & 0xffu);
        op[MBYTE] = (uint8_t)((r >> 8) & 0xffu);
        op[LBYTE] = (uint8_t)((r >> 0) & 0xffu);
    }
}