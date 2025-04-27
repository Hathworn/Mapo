#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void combine_kernel(int nPixels, int cuePitchInFloats, float* devBg, float* devCga, float* devCgb, float* devTg, float* devMpb, float* devCombinedg) {
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    int orientation = threadIdx.y;
    int orientedIndex = orientation * cuePitchInFloats + index;

    if (index < nPixels) {
        float accumulant = 0.0;
        float accumulant2 = 0.0;

        // Use a loop for repeated operations to improve code maintainability
        float* sources[] = {devBg, devCga, devCgb, devTg};
        int numSources = sizeof(sources) / sizeof(sources[0]);

        #pragma unroll // Unroll loop for performance improvement
        for (int i = 0; i < numSources; ++i) {
            float* pointer = &sources[i][orientedIndex];
            int baseIndex = i * 3;
            
            #pragma unroll // Unroll inner loop for performance
            for (int j = 0; j < 3; ++j) {
                accumulant += *pointer * coefficients[baseIndex + j];
                accumulant2 += *pointer * weights[baseIndex + j];
                pointer += 8 * cuePitchInFloats; // Advance pointer as before
            }
        }

        devMpb[orientedIndex] = accumulant;
        devCombinedg[orientedIndex] = accumulant2;
    }
}