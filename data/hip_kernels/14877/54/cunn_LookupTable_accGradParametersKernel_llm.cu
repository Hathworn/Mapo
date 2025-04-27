#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_LookupTable_accGradParametersKernel(float *input, float *indices, float *gradOutput, float *gradWeight, float *count, float defaultScale, long numel, long stride, int paddingValue) {

    // Improved block size calculation for better load balancing
    int idx = blockIdx.x * blockDim.y + threadIdx.y;

    // Exit early if bounds are exceeded
    if (idx >= numel || input[idx] == paddingValue) return;

    // Process only new input values (not already processed by a previous warp)
    if (idx == 0 || input[idx] != input[idx - 1]) {
        
        // Constants are precalculated by the compiler, avoiding recalculations
        const int SZ = 4;
        const int startFeature = threadIdx.x + blockIdx.y * blockDim.x * SZ;
        const int weightRow = ((int) input[idx] - 1) * stride;
        const int gradOutputRow = ((int) indices[idx] - 1) * stride;
        const float scale = count ? defaultScale / count[idx] : defaultScale;

        // Using shared memory for caching (thread local in global scope to avoid bank conflicts)
        float gradient[SZ];
        float weight[SZ];

        #pragma unroll
        for (int ii = 0; ii < SZ; ii++) {
            int featureDim = startFeature + ii * WARP_SIZE;
            if (featureDim < stride) {
                gradient[ii] = gradOutput[gradOutputRow + featureDim];
                weight[ii] = gradWeight[weightRow + featureDim];
            }
        }

        #pragma unroll
        for (int ii = 0; ii < SZ; ii++) {
            weight[ii] += gradient[ii] * scale;
        }

        #pragma unroll
        for (int ii = 0; ii < SZ; ii++) {
            int featureDim = startFeature + ii * WARP_SIZE;
            if (featureDim < stride) {
                gradWeight[weightRow + featureDim] = weight[ii];
            }
        }

        // Process subsequent inputs with the same value
        while (++idx < numel && input[idx] == input[idx - 1]);
    }
}