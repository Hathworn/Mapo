#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_mix16_1(int32_t * ip, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples, int32_t m2, int32_t mixbits, int32_t mixres) {
    int z = threadIdx.x + blockIdx.x * blockDim.x;

    if (z < numSamples) {
        // Unroll and simplify operations for better performance
        int32_t temp = ip[z];
        int16_t l = (int16_t)temp;
        int16_t r = (int16_t)(temp >> 16);

        // Use a single multiplication for vector optimization
        int32_t mixed = (mixres * l + m2 * r);

        // Reduce shifts and use pre-computation when possible
        u[z] = mixed >> mixbits;
        v[z] = l - r;
    }
}