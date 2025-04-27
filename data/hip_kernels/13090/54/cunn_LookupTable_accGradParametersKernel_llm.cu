#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_LookupTable_accGradParametersKernel(float *input, float *indices, float *gradOutput, float *gradWeight, float *count, float defaultScale, long numel, long stride)
{
    int idx = blockIdx.x * 4 + threadIdx.y;  // Thread index within the grid
    const int SZ = 4;  // Number of operations each thread will perform

    // Check if the current input is the first of its group
    if (idx < numel && (idx == 0 || input[idx] != input[idx - 1]))
    {
        do
        {
            const int startFeature = threadIdx.x + blockIdx.y * blockDim.x * SZ;
            const int weightRow = ((int)input[idx] - 1) * stride;
            const int gradOutputRow = ((int)indices[idx] - 1) * stride;
            const float scale = count ? defaultScale / count[idx] : defaultScale;

            float gradient[SZ];
            float weight[SZ];

            // Use a single loop to read gradOutput and gradWeight
            for (int ii = 0; ii < SZ; ii++)
            {
                int featureDim = startFeature + ii * WARP_SIZE;
                if (featureDim < stride)
                {
                    gradient[ii] = gradOutput[gradOutputRow + featureDim];
                    weight[ii] = gradWeight[weightRow + featureDim];
                }
            }

            // Update weights using a single loop
            for (int ii = 0; ii < SZ; ii++)
            {
                weight[ii] += gradient[ii] * scale;
            }

            // Write updated weights back using a single loop
            for (int ii = 0; ii < SZ; ii++)
            {
                int featureDim = startFeature + ii * WARP_SIZE;
                if (featureDim < stride)
                {
                    gradWeight[weightRow + featureDim] = weight[ii];
                }
            }

            idx++;
        } while (idx < numel && input[idx] == input[idx - 1]);
    }
}