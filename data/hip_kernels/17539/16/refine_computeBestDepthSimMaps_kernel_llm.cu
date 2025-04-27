#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float refineDepthSubPixel(const float3& depths, const float3& sims)
{
    float outDepth = -1.0f;

    float simM1 = (sims.x + 1.0f) * 0.5f; // Normalize similarity values to range [0, 1]
    float simP1 = (sims.z + 1.0f) * 0.5f;
    float sim1 = (sims.y + 1.0f) * 0.5f;

    if((simM1 > sim1) && (simP1 > sim1))
    {
        float dispStep = -((simP1 - simM1) / (2.0f * (simP1 + simM1 - 2.0f * sim1)));

        float b = (depths.z + depths.x) * 0.5f; // Calculate midpoint for linear interpolation
        float a = b - depths.x; // Determine slope

        outDepth = a * dispStep + b; // Compute refined depth
    }

    return outDepth;
}

__global__ void refine_computeBestDepthSimMaps_kernel(float* osim, int osim_p, float* odpt, int odpt_p, float3* isims, int isims_p, float3* idpts, int idpts_p, int width, int height, float simThr)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if((x < width) && (y < height))
    {
        float3 depths = idpts[y * idpts_p + x];
        float3 sims = isims[y * isims_p + x];

        // Select best depth and similarity
        float outDepth = ((sims.x < sims.y) ? depths.x : depths.y);
        float outSim = ((sims.x < sims.y) ? sims.x : sims.y);
        outDepth = ((sims.z < outSim) ? depths.z : outDepth);
        outSim = ((sims.z < outSim) ? sims.z : outSim);

        float refinedDepth = refineDepthSubPixel(depths, sims);
        if(refinedDepth > 0.0f)
        {
            outDepth = refinedDepth; // Update outDepth if refinement is valid
        }

        osim[y * osim_p + x] = (outSim < simThr ? outSim : 1.0f);
        odpt[y * odpt_p + x] = (outSim < simThr ? outDepth : -1.0f);
    }
}