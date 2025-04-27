#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_LookupTable_accGradParametersKernel(float *input, float *indices, float *gradOutput, float *gradWeight, float *count, float defaultScale, long numel, long stride) {

    int idx = blockIdx.x * 4 + threadIdx.y;

    // Ensure the entire warp exits early if redundant input
    if (idx < numel && (idx == 0 || input[idx] != input[idx - 1])) {
        do {
            // Optimize shared memory access per warp
            const int startFeature = threadIdx.x + blockIdx.y * blockDim.x * 2;
            const int weightRow = ((int) input[idx] - 1) * stride;
            const int gradOutputRow = ((int) indices[idx] - 1) * stride;
            
            const float scale = count ? defaultScale / count[idx] : defaultScale;
            float gradient[2];
            float weight[2];

            #pragma unroll
            for (int ii = 0; ii < 2; ii++) { // Reduced unroll factor for better reg usage
                int featureDim = startFeature + ii * WARP_SIZE;
                if (featureDim < stride) {
                    gradient[ii] = gradOutput[gradOutputRow + featureDim];
                    weight[ii] = gradWeight[weightRow + featureDim];
                }
            }

            #pragma unroll
            for (int ii = 0; ii < 2; ii++) { // Use the unroll for update
                weight[ii] += gradient[ii] * scale;
            }

            #pragma unroll
            for (int ii = 0; ii < 2; ii++) { // Optimize store operations
                int featureDim = startFeature + ii * WARP_SIZE;
                if (featureDim < stride) {
                    gradWeight[weightRow + featureDim] = weight[ii];
                }
            }

            idx++;
        } while (idx < numel && input[idx] == input[idx - 1]);
    }
}