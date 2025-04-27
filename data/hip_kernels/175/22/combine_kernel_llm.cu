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
        float* pointers[4] = { &devBg[orientedIndex], &devCga[orientedIndex], &devCgb[orientedIndex], &devTg[orientedIndex] };
        const int offsets[3] = { 0, 8 * cuePitchInFloats, 16 * cuePitchInFloats };

        #pragma unroll // Unroll the loop to enhance performance
        for (int i = 0; i < 3; ++i) {
            accumulant += pointers[0][offsets[i]] * coefficients[i] + 
                          pointers[1][offsets[i]] * coefficients[3 + i] + 
                          pointers[2][offsets[i]] * coefficients[6 + i] + 
                          pointers[3][offsets[i]] * coefficients[9 + i];
            accumulant2 += pointers[0][offsets[i]] * weights[i] + 
                           pointers[1][offsets[i]] * weights[3 + i] + 
                           pointers[2][offsets[i]] * weights[6 + i] + 
                           pointers[3][offsets[i]] * weights[9 + i];
        }
        
        devMpb[orientedIndex] = accumulant;
        devCombinedg[orientedIndex] = accumulant2;
    }
}