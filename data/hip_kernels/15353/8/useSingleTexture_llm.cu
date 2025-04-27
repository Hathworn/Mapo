#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void useSingleTexture(hipTextureObject_t tex, float* pout)
{
    // Precompute indices
    unsigned int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int globalIdy = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int globalIdz = blockIdx.z * blockDim.z + threadIdx.z;
    unsigned int linearIdx = globalIdx + c_size.x * (globalIdy + globalIdz * c_size.y);

    // Sample the texture
    float4 sample = tex3D<float4>(tex, globalIdx + 0.5f, globalIdy + 0.5f, globalIdz + 0.5f);

    // Store result in output array using square root of dot product
    pout[linearIdx] = sqrtf(sample.x * sample.x + sample.y * sample.y + sample.z * sample.z);
}