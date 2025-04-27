#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_mix24_1_1(uint8_t *ip, uint32_t stride, int32_t *u, int32_t *v, int32_t numSamples, uint16_t *shiftUV, int32_t mixres, uint32_t mask, int32_t m2, int32_t mixbits, int32_t shift)
{
    int z = blockIdx.x * blockDim.x + threadIdx.x;
    if (z >= numSamples) return; // Simplified boundary check

    int32_t l, r;
    int32_t k = z * 2;

    // Efficiently calculate the base pointer for `ip`
    uint8_t *ipCurrent = ip + (3 * stride - 3) * z;

    // Merge the extraction and conversion of l and r
    l = (((int32_t)ipCurrent[2] << 16) | ((int32_t)ipCurrent[1] << 8) | (int32_t)ipCurrent[0]) << 8 >> 8;
    ipCurrent += 3;
    r = (((int32_t)ipCurrent[2] << 16) | ((int32_t)ipCurrent[1] << 8) | (int32_t)ipCurrent[0]) << 8 >> 8;

    // Update shiftUV array
    shiftUV[k] = (uint16_t)(l & mask);
    shiftUV[k + 1] = (uint16_t)(r & mask);

    // Shifting l and r
    l >>= shift;
    r >>= shift;

    // Updating u and v
    u[z] = (mixres * l + m2 * r) >> mixbits;
    v[z] = l - r;
}