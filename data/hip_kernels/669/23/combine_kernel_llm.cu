```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void combine_kernel(int nPixels, int cuePitchInFloats, float* devBg, float* devCga, float* devCgb, float* devTg, float* devMpb, float* devCombinedg) {
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    int orientation = threadIdx.y;
    int orientedIndex = orientation * cuePitchInFloats + index;
    
    if (index < nPixels) {
        float accumulant = 0.0f;
        float accumulant2 = 0.0f;
        
        // Use a loop to reduce repetitive code
        float* inputs[4] = {devBg, devCga, devCgb, devTg};
        int coefIdx = 0;
        
        #pragma unroll
        for (int i = 0; i < 4; ++i) {
            float* basePointer = &inputs[i][orientedIndex];
            
            for (int j = 0; j < 3; ++j) {
                accumulant += basePointer[j * 8 * cuePitchInFloats] * coefficients[coefIdx];
                accumulant2 += basePointer[j * 8 * cuePitchInFloats] * weights[coefIdx];
                ++coefIdx;
            }
        }
        
        devMpb[orientedIndex] = accumulant;
        devCombinedg[orientedIndex] = accumulant2;
    }
}