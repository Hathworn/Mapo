#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_mix24_2_1(uint8_t * ip, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples, uint16_t * shiftUV, uint32_t mask, int32_t shift)
{
    int z = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure thread index is within bounds
    if (z < numSamples)
    {
        int32_t l, r;
        int32_t k = z * 2;

        // Optimize memory access by calculating offsets only once
        uint8_t* ip_base = ip + (stride * z * 3);
        uint8_t* ip_offset = ip_base + z * 3;

        // Pack bytes into 32-bit integer efficiently
        l = (int32_t)(((uint32_t)ip_offset[HBYTE] << 16) | ((uint32_t)ip_offset[MBYTE] << 8) | ((uint32_t)ip_offset[LBYTE]));
        l = (l << 8) >> 8;  // Remove sign bit efficiently

        ip_offset += 3;
        r = (int32_t)(((uint32_t)ip_offset[HBYTE] << 16) | ((uint32_t)ip_offset[MBYTE] << 8) | ((uint32_t)ip_offset[LBYTE]));
        r = (r << 8) >> 8;  // Remove sign bit efficiently

        // Store results with mask application
        shiftUV[k] = (uint16_t)(l & mask);
        shiftUV[k + 1] = (uint16_t)(r & mask);

        // Calculate shifted values more efficiently
        u[z] = l >> shift;
        v[z] = r >> shift;
    }
}