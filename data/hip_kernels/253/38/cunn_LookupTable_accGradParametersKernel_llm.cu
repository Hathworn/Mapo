#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_LookupTable_accGradParametersKernel( float *input, float *indices, float *gradOutput, float *gradWeight, float *count, float defaultScale, long numel, long stride) {

    int idx = blockIdx.x * 4 + threadIdx.y;

    // Precompute values used multiple times in loop
    const int SZ = 4;
    const int warpStartFeature = blockIdx.y * blockDim.x;

    // Process if idx is in range and it's the start of a new sequence
    if (idx < numel && (idx == 0 || input[idx] != input[idx - 1])) {
        do {
            const int startFeature = threadIdx.x + warpStartFeature;
            const int weightRow = ((int) input[idx] - 1) * stride;
            const int gradOutputRow = ((int) indices[idx] - 1) * stride;
            const float scale = count ? defaultScale / count[idx] : defaultScale;

            float gradient[SZ] = {0.0};
            float weight[SZ] = {0.0};

            // Unroll and optimize memory accesses
            #pragma unroll
            for (int ii = 0; ii < SZ; ii++) {
                int featureDim = startFeature + ii * WARP_SIZE;
                if (featureDim < stride) {
                    gradient[ii] = gradOutput[gradOutputRow + featureDim];
                    weight[ii] = gradWeight[weightRow + featureDim];
                }
            }

            // Parallelize gradient update
            #pragma unroll
            for (int ii = 0; ii < SZ; ii++) {
                weight[ii] += gradient[ii] * scale;
            }

            // Efficient memory write-back
            #pragma unroll
            for (int ii = 0; ii < SZ; ii++) {
                int featureDim = startFeature + ii * WARP_SIZE;
                if (featureDim < stride) {
                    gradWeight[weightRow + featureDim] = weight[ii];
                }
            }

            idx++;
        } while (idx < numel && input[idx] == input[idx - 1]);
    }
}