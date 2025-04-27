#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_LookupTable_accGradParametersKernel( float *input,  float *indices, float *gradOutput, float *gradWeight, float *count, float defaultScale, long numel, long stride)
{
    int idx = blockIdx.x * 4 + threadIdx.y;

    // Calculate unique warp-level ID
    const int laneID = threadIdx.x % WARP_SIZE;

    // Number of values processed by each thread (grain size)
    const int SZ = 4;

    if (idx < numel && (idx == 0 || input[idx] != input[idx - 1]))
    {
        do
        {
            const int startFeature = laneID + blockIdx.y * blockDim.x * SZ; // Utilize laneID
            const int weightRow = ((int) input[idx] - 1) * stride;
            const int gradOutputRow = ((int) indices[idx] - 1) * stride;
            const float scale = count ? defaultScale / count[idx] : defaultScale;

            float gradient[SZ] = {0.0f}; // Initialize gradient array
            float weight[SZ] = {0.0f};   // Initialize weight array

            #pragma unroll
            for (int ii = 0; ii < SZ; ii++)
            {
                int featureDim = startFeature + ii * WARP_SIZE;
                if (featureDim < stride)
                {
                    gradient[ii] = gradOutput[gradOutputRow + featureDim];
                    weight[ii] = gradWeight[weightRow + featureDim];
                }
            }

            #pragma unroll
            for (int ii = 0; ii < SZ; ii++)
            {
                weight[ii] += gradient[ii] * scale;
            }

            #pragma unroll
            for (int ii = 0; ii < SZ; ii++)
            {
                int featureDim = startFeature + ii * WARP_SIZE;
                if (featureDim < stride)
                {
                    gradWeight[weightRow + featureDim] = weight[ii];
                }
            }

            // Advance index
            idx += WARP_SIZE; // Advance by the warp size

        } while (idx < numel && input[idx] == input[idx - 1]);
    }
}