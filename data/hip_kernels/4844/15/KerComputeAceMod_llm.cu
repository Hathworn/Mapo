#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerComputeAceMod(unsigned n, const float3 *ace, float *acemod)
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x;
    if (p < n) {
        float3 r = ace[p];
        acemod[p] = r.x * r.x + r.y * r.y + r.z * r.z;
    }
}