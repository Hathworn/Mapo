#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void complexmult_conj_kernal(float *afft, const float *bfft, int totaltc)
{
    // Calculate index ensuring coalesced memory access
    const uint idx = threadIdx.x + (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x;
    const uint ridx = 2 * idx; // Separate real and imaginary parts

    if (ridx < totaltc) {
        // Load complex numbers using float2 for better performance
        float2 a = *((float2*)&afft[ridx]);
        float2 b = *((float2*)&bfft[ridx]);

        // Perform complex multiplication with conjugated second operand
        afft[ridx] = a.x * b.x + a.y * b.y;    // Real part
        afft[ridx + 1] = a.y * b.x - a.x * b.y; // Imaginary part
    }
}