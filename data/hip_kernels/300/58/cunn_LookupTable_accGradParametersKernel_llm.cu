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

            float gradient[SZ];
            float weight[SZ];

            // Use thread-level parallelism within a warp
            for (int ii = threadIdx.x; ii < SZ; ii += WARP_SIZE) {
                int featureDim = startFeature + ii * WARP_SIZE;
                if (featureDim < stride) {
                    gradient[ii] = gradOutput[gradOutputRow + featureDim];
                    weight[ii] = gradWeight[weightRow + featureDim];
                }
            }

            // Reduce memory transactions by directly updating gradWeight
            for (int ii = threadIdx.x; ii < SZ; ii += WARP_SIZE) {
                int featureDim = startFeature + ii * WARP_SIZE;
                if (featureDim < stride) {
                    gradWeight[weightRow + featureDim] += gradient[ii] * scale;
                }
            }

            idx++;
        } while (idx < numel && input[idx] == input[idx - 1]);
    }
}