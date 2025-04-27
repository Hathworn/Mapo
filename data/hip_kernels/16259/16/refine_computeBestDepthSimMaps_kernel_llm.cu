#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float refineDepthSubPixel(const float3& depths, const float3& sims)
{
    float outDepth = -1.0f;

    float simM1 = (sims.x + 1.0f) * 0.5f;
    float simP1 = (sims.z + 1.0f) * 0.5f;
    float sim1 = (sims.y + 1.0f) * 0.5f;

    if ((simM1 > sim1) && (simP1 > sim1))
    {
        float dispStep = -((simP1 - simM1) / (2.0f * (simP1 + simM1 - 2.0f * sim1)));
        float floatDepthM1 = depths.x;
        float floatDepthP1 = depths.z;
        float b = (floatDepthP1 + floatDepthM1) * 0.5f;
        float a = b - floatDepthM1;
        outDepth = a * dispStep + b;
    }

    return outDepth;
}

__global__ void refine_computeBestDepthSimMaps_kernel(float* osim, int osim_p, float* odpt, int odpt_p, float3* isims, int isims_p, float3* idpts, int idpts_p, int width, int height, float simThr)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height)
    {
        float3 depths = idpts[y * idpts_p + x];
        float3 sims = isims[y * isims_p + x];

        // Choosing the best depth and similarity
        float outDepth = (sims.x < sims.y) ? depths.x : depths.y;
        float outSim = (sims.x < sims.y) ? sims.x : sims.y;
        if (sims.z < outSim) {
            outDepth = depths.z;
            outSim = sims.z;
        }

        // Refine depth if possible
        float refinedDepth = refineDepthSubPixel(depths, sims);
        if (refinedDepth > 0.0f) {
            outDepth = refinedDepth;
        }

        // Update result arrays
        osim[y * osim_p + x] = (outSim < simThr ? outSim : 1.0f);
        odpt[y * odpt_p + x] = (outSim < simThr ? outDepth : -1.0f);
    }
}