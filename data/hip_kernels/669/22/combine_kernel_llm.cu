#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void combine_kernel(int nPixels, int cuePitchInFloats, float* devBg, float* devCga, float* devCgb, float* devTg, float* devMpb, float* devCombinedg) {
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    int orientation = threadIdx.y;
    int orientedIndex = orientation * cuePitchInFloats + index;

    if (index < nPixels) {
        float accumulant = 0.0f;
        float accumulant2 = 0.0f;

        // Use loop unrolling for better performance
        #pragma unroll
        for (int i = 0; i < 3; ++i) {
            float* pointer = &devBg[orientedIndex + 8 * i * cuePitchInFloats];
            accumulant += *pointer * coefficients[i];
            accumulant2 += *pointer * weights[i];
        }

        #pragma unroll
        for (int i = 3; i < 6; ++i) {
            float* pointer = &devCga[orientedIndex + 8 * (i - 3) * cuePitchInFloats];
            accumulant += *pointer * coefficients[i];
            accumulant2 += *pointer * weights[i];
        }

        #pragma unroll
        for (int i = 6; i < 9; ++i) {
            float* pointer = &devCgb[orientedIndex + 8 * (i - 6) * cuePitchInFloats];
            accumulant += *pointer * coefficients[i];
            accumulant2 += *pointer * weights[i];
        }

        #pragma unroll
        for (int i = 9; i < 12; ++i) {
            float* pointer = &devTg[orientedIndex + 8 * (i - 9) * cuePitchInFloats];
            accumulant += *pointer * coefficients[i];
            accumulant2 += *pointer * weights[i];
        }

        devMpb[orientedIndex] = accumulant;
        devCombinedg[orientedIndex] = accumulant2;
    }
}