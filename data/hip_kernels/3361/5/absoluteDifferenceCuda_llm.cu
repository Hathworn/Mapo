#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void absoluteDifferenceCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height) 
{
    // Calculate single index for x and y to avoid recomputation
    const uint32_t idx = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t idy = blockDim.y * blockIdx.y + threadIdx.y;

    if (idx < width && idy < height) 
    {
        // Use a single calculation for offsets
        const uint32_t in1Offset = idy * rowSizeIn1 + idx;
        const uint32_t in2Offset = idy * rowSizeIn2 + idx;
        const uint32_t outOffset = idy * rowSizeOut + idx;

        // Store values locally to reduce global memory accesses
        const uint8_t valIn1 = in1[in1Offset];
        const uint8_t valIn2 = in2[in2Offset];

        // Calculate absolute difference and store the result
        out[outOffset] = abs(valIn1 - valIn2);
    }
}