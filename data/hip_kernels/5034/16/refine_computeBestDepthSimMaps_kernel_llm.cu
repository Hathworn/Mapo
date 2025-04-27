#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float refineDepthSubPixel(const float3& depths, const float3& sims)
{
    float outDepth = -1.0f;

    float simM1 = sims.x;
    float simP1 = sims.z;
    float sim1 = sims.y;
    simM1 = (simM1 + 1.0f) / 2.0f;
    simP1 = (simP1 + 1.0f) / 2.0f;
    sim1 = (sim1 + 1.0f) / 2.0f;

    if ((simM1 > sim1) && (simP1 > sim1))
    {
        float dispStep = -((simP1 - simM1) / (2.0f * (simP1 + simM1 - 2.0f * sim1)));

        float floatDepthM1 = depths.x;
        float floatDepthP1 = depths.z;

        float b = (floatDepthP1 + floatDepthM1) / 2.0f;
        float a = b - floatDepthM1;

        outDepth = a * dispStep + b;
    }

    return outDepth;
}

__global__ void refine_computeBestDepthSimMaps_kernel(float* osim, int osim_p, float* odpt, int odpt_p, float3* isims, int isims_p, float3* idpts, int idpts_p, int width, int height, float simThr)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure within bounds for computation
    if ((x < width) && (y < height))
    {
        float3 depths = idpts[y * idpts_p + x];
        float3 sims = isims[y * isims_p + x];

        // Use ternary operators for clearer logic flow
        float outDepth = (sims.x < sims.y) ? depths.x : depths.y;
        float outSim = (sims.x < sims.y) ? sims.x : sims.y;

        // Compare with third value
        outDepth = (sims.z < outSim) ? depths.z : outDepth;
        outSim = (sims.z < outSim) ? sims.z : outSim;

        // Optimize depth refinement
        float refinedDepth = refineDepthSubPixel(depths, sims);
        if (refinedDepth > 0.0f)
        {
            outDepth = refinedDepth;
        }

        // Store results conditionally based on threshold
        osim[y * osim_p + x] = (outSim < simThr) ? outSim : 1.0f;
        odpt[y * odpt_p + x] = (outSim < simThr) ? outDepth : -1.0f;
    }
}