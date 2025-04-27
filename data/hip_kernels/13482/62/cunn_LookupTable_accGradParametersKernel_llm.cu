#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_LookupTable_accGradParametersKernel( float *input, float *indices, float *gradOutput, float *gradWeight, float *count, float defaultScale, long numel, long stride, int paddingValue) {

    int idx = blockIdx.x * 4 + threadIdx.y;

    // Number of values processed by each thread (grain size)
    const int SZ = 4;

    if (idx < numel
    && (idx == 0 || input[idx] != input[idx - 1])
    && input[idx] != paddingValue) {
        do {
            const int startFeature = threadIdx.x + blockIdx.y * blockDim.x * SZ;
            const int weightRow = ((int) input[idx] - 1) * stride;
            const int gradOutputRow = ((int) indices[idx] - 1) * stride;
            const float scale = count ? defaultScale / count[idx] : defaultScale;

            float gradient[SZ] = {0};  // Initialize gradient array
            float weight[SZ] = {0};    // Initialize weight array

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

            idx++;
        } while (idx < numel && input[idx] == input[idx - 1]);
    }
}