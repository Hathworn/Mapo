#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float refineDepthSubPixel(const float3& depths, const float3& sims) {
    float outDepth = -1.0f;

    // Normalize and pre-compute common expressions
    float simM1 = (sims.x + 1.0f) * 0.5f;
    float sim1 = (sims.y + 1.0f) * 0.5f;
    float simP1 = (sims.z + 1.0f) * 0.5f;

    if ((simM1 > sim1) && (simP1 > sim1)) {
        float dispStep = -(simP1 - simM1) / (2.0f * (simP1 + simM1 - 2.0f * sim1));
        float floatDepthM1 = depths.x;
        float floatDepthP1 = depths.z;

        // Calculate a and b for quadratic interpolation
        float b = 0.5f * (floatDepthP1 + floatDepthM1);
        float a = b - floatDepthM1;

        // Compute refined depth
        outDepth = a * dispStep + b;
    }

    return outDepth;
}

__global__ void refine_computeBestDepthSimMaps_kernel(float* osim, int osim_p, float* odpt, int odpt_p, float3* isims, int isims_p, float3* idpts, int idpts_p, int width, int height, float simThr) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        float3 depths = idpts[y * idpts_p + x];
        float3 sims = isims[y * isims_p + x];

        // Determine best initial depth and similarity
        float outDepth = depths.x;
        float outSim = sims.x;
        if (sims.y < outSim) {
            outDepth = depths.y;
            outSim = sims.y;
        }
        if (sims.z < outSim) {
            outDepth = depths.z;
            outSim = sims.z;
        }

        // Refine depth using subpixel method
        float refinedDepth = refineDepthSubPixel(depths, sims);
        if (refinedDepth > 0.0f) {
            outDepth = refinedDepth;
        }

        // Update output maps based on similarity threshold
        if (outSim < simThr) {
            osim[y * osim_p + x] = outSim;
            odpt[y * odpt_p + x] = outDepth;
        } else {
            osim[y * osim_p + x] = 1.0f;
            odpt[y * odpt_p + x] = -1.0f;
        }
    }
}