#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void complexmult_kernal(float *afft, const float *bfft, int totaltc)
{
    const uint tid = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * gridDim.x * blockDim.x;
    const uint ridx = 2 * tid;

    if (ridx < totaltc) {
        const uint iidx = ridx + 1;

        // Use float2 for coalesced memory access
        float2 a = *reinterpret_cast<float2*>(&afft[ridx]);
        float2 b = *reinterpret_cast<const float2*>(&bfft[ridx]);

        // Complex multiplication using float2
        afft[ridx] = a.x * b.x - a.y * b.y;   // real part
        afft[iidx] = a.y * b.x + a.x * b.y;   // imaginary part
    }
}