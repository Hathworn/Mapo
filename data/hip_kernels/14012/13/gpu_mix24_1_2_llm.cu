#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_mix24_1_2(uint8_t *ip, uint32_t stride, int32_t *u, int32_t *v, int32_t numSamples, int32_t mixres, int32_t m2, int32_t mixbits)
{
    int z = threadIdx.x + blockIdx.x * blockDim.x;
    if (z < numSamples)
    {
        // Pointer arithmetic optimization
        uint8_t *ip_z = ip + 3 * ((stride - 1) * z + z);
        
        // Use local variables to avoid repeated pointer dereferencing
        uint32_t l_high = (uint32_t)ip_z[HBYTE];
        uint32_t l_middle = (uint32_t)ip_z[MBYTE];
        uint32_t l_low = (uint32_t)ip_z[LBYTE];

        int32_t l = (int32_t)((l_high << 16) | (l_middle << 8) | l_low);
        l = (l << 8) >> 8; // Byte re-sign extension

        ip_z += 3;
        uint32_t r_high = (uint32_t)ip_z[HBYTE];
        uint32_t r_middle = (uint32_t)ip_z[MBYTE];
        uint32_t r_low = (uint32_t)ip_z[LBYTE];

        int32_t r = (int32_t)((r_high << 16) | (r_middle << 8) | r_low);
        r = (r << 8) >> 8; // Byte re-sign extension

        u[z] = (mixres * l + m2 * r) >> mixbits; // Mixing operation
        v[z] = l - r; // Difference calculation
    }
}