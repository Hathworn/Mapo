#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_unmix16(int32_t * u, int32_t * v, int16_t * out, uint32_t stride, uint32_t * numSamples, int32_t * mixbits, int32_t * mixres, int32_t theOutputPacketBytes, uint32_t frameLength)
{
    int block = blockIdx.x % 8;
    int index = blockIdx.x / 8;
    int z = threadIdx.x + block * blockDim.x;

    if (z < numSamples[index]) 
    {
        int32_t l, r;
        int16_t *op = out + (index * theOutputPacketBytes) / 2 + stride * z;  // Move stride calculation outside condition

        int32_t u_val = (u + index * frameLength)[z];  // Load shared values to local variables
        int32_t v_val = (v + index * frameLength)[z];

        if (mixres[index] != 0)
        {
            // Matrixed stereo processing
            l = u_val + v_val - ((mixres[index] * v_val) >> mixbits[index]);
            r = l - v_val;
        }
        else
        {
            // Conventional separated stereo
            l = u_val;
            r = v_val;
        }
        
        op[0] = (int16_t)l;  // Write computed values
        op[1] = (int16_t)r;
    }
}