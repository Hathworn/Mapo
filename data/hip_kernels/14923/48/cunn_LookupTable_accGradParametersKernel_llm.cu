#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_LookupTable_accGradParametersKernel(float *input, float *indices, float *gradOutput, float *gradWeight, float *count, float defaultScale, long numel, long stride) {

    int idx = blockIdx.x * 4 + threadIdx.y;

    // Optimized: Ensure idx is valid, and previous input is different or idx is 0
    if (idx < numel && (idx == 0 || input[idx] != input[idx - 1])) {
        // Optimized: Use a while loop efficiently to process repeated inputs
        do {
            const int startFeature = threadIdx.x + blockIdx.y * blockDim.x * 4;
            const int weightRow = __float2int_rd(input[idx]) * stride - stride; // simplified calculation
            const int gradOutputRow = __float2int_rd(indices[idx]) * stride - stride; // simplified calculation
            const float scale = count ? defaultScale / count[idx] : defaultScale;

            float gradient[4];
            float weight[4];

            #pragma unroll
            for (int ii = 0; ii < 4; ii++) {
                int featureDim = startFeature + ii * WARP_SIZE;
                if (featureDim < stride) {
                    int gradOutputIndex = gradOutputRow + featureDim;
                    int gradWeightIndex = weightRow + featureDim;
                    gradient[ii] = gradOutput[gradOutputIndex];
                    weight[ii] = gradWeight[gradWeightIndex];
                }
            }

            #pragma unroll
            for (int ii = 0; ii < 4; ii++) {
                weight[ii] += gradient[ii] * scale;
            }

            #pragma unroll
            for (int ii = 0; ii < 4; ii++) {
                int featureDim = startFeature + ii * WARP_SIZE;
                if (featureDim < stride) {
                    int gradWeightIndex = weightRow + featureDim;
                    gradWeight[gradWeightIndex] = weight[ii];
                }
            }
            
            idx++;
        } while (idx < numel && input[idx] == input[idx - 1]);
    }
}