#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_unmix20(int32_t * u, int32_t * v, uint8_t * out, uint32_t stride, uint32_t * numSamples, int32_t * mixbits, int32_t * mixres, int32_t theOutputPacketBytes, uint32_t frameLength)
{
    // Calculate effective thread index for processing
    int myIndex = blockIdx.x * blockDim.x + threadIdx.x;
    int index = myIndex / blockDim.x;  // Specific output packet index

    // Check if thread is within number of samples
    if (threadIdx.x < numSamples[index])
    {
        int32_t l, r;
        uint8_t * op = out + (index * theOutputPacketBytes);

        int32_t u_val = (u + index * frameLength)[threadIdx.x];
        int32_t v_val = (v + index * frameLength)[threadIdx.x];
        
        // Matrixed stereo mode
        if (mixres[index] != 0)
        {
            l = u_val + v_val - ((mixres[index] * v_val) >> mixbits[index]);
            r = l - v_val;
        }
        else
        {
            // Conventional separated stereo mode
            l = u_val;
            r = v_val;
        }

        // Left and Right channel packing and storing
        l <<= 4;
        r <<= 4;

        op += 3 * threadIdx.x + (stride - 1) * 3 * threadIdx.x;
        op[HBYTE] = (uint8_t)((l >> 16) & 0xffu);
        op[MBYTE] = (uint8_t)((l >> 8) & 0xffu);
        op[LBYTE] = (uint8_t)((l >> 0) & 0xffu);
        op += 3;

        op[HBYTE] = (uint8_t)((r >> 16) & 0xffu);
        op[MBYTE] = (uint8_t)((r >> 8) & 0xffu);
        op[LBYTE] = (uint8_t)((r >> 0) & 0xffu);
    }
}