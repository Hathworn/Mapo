#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_mix24_2_2(uint8_t * ip, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples)
{
    int z = threadIdx.x + blockIdx.x * blockDim.x;
    if (z < numSamples)
    {
        int32_t l, r;
        uint8_t* ip_offset = ip + 3 * z * stride;  // Calculate offset once

        // Load and process left sample
        l = (int32_t)(((uint32_t)ip_offset[HBYTE] << 16) | ((uint32_t)ip_offset[MBYTE] << 8) | (uint32_t)ip_offset[LBYTE]);
        u[z] = (l << 8) >> 8;
        
        // Load and process right sample
        ip_offset += 3;  // Increment offset directly
        r = (int32_t)(((uint32_t)ip_offset[HBYTE] << 16) | ((uint32_t)ip_offset[MBYTE] << 8) | (uint32_t)ip_offset[LBYTE]);
        v[z] = (r << 8) >> 8;
    }
}