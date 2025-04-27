#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_LookupTable_accGradParametersKernel(float *input, float *indices, float *gradOutput, float *gradWeight, float *count, float defaultScale, long numel, long stride) {

    // Efficiently calculate idx for warp-level parallelism
    int idx = blockIdx.x * blockDim.y + threadIdx.y;

    // Handle boundary conditions and skip redundant computations
    if (idx >= numel || (idx != 0 && input[idx] == input[idx - 1])) return;

    const int SZ = 4; // Define grain size for each thread

    do {
        // Calculate starting feature for the current thread
        const int startFeature = threadIdx.x + blockIdx.y * blockDim.x * SZ;
        const int weightRow = ((int) input[idx] - 1) * stride;
        const int gradOutputRow = ((int) indices[idx] - 1) * stride;
        const float scale = count ? defaultScale / count[idx] : defaultScale;

        float gradient[SZ];
        float weight[SZ];

        // Preload gradient and weight values using unrolled loop
        #pragma unroll
        for (int ii = 0; ii < SZ; ii++) {
            int featureDim = startFeature + ii * WARP_SIZE;
            if (featureDim < stride) {
                gradient[ii] = gradOutput[gradOutputRow + featureDim];
                weight[ii] = gradWeight[weightRow + featureDim];
            }
        }

        // Perform scaled addition operation using unrolled loop
        #pragma unroll
        for (int ii = 0; ii < SZ; ii++) {
            weight[ii] += gradient[ii] * scale;
        }

        // Write back computed weights using unrolled loop
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