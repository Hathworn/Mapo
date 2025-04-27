#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float Sat(float r, float g, float b) {
    float min = fminf(fminf(r, g), b);
    float max = fmaxf(fmaxf(r, g), b);
    float delta = max - min;
    float S = max != 0.0f ? delta / max : 0.0f;
    return S;
}

__global__ void FilmGradeKernelC(float* p_Input, int p_Width, int p_Height, float p_ContR, float p_ContG, float p_ContB, float p_SatR, float p_SatG, float p_SatB, float p_ContP) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x < p_Width && y < p_Height) {
        const int index = (y * p_Width + x) * 4;
        float contR = (p_Input[index] - p_ContP) * p_ContR + p_ContP;
        float contG = (p_Input[index + 1] - p_ContP) * p_ContG + p_ContP;
        float contB = (p_Input[index + 2] - p_ContP) * p_ContB + p_ContP;

        // Compute luma using constants
        float luma = contR * 0.2126f + contG * 0.7152f + contB * 0.0722f;

        // Constants for saturation computation
        float satFactor = 1.0f - (p_SatR * 0.2126f + p_SatG * 0.7152f + p_SatB * 0.0722f);

        // Apply saturation to each channel
        float outR = satFactor * luma + contR * p_SatR;
        float outG = satFactor * luma + contG * p_SatG;
        float outB = satFactor * luma + contB * p_SatB;

        // Output the saturated values
        p_Input[index] = outR;
        p_Input[index + 1] = outG;
        p_Input[index + 2] = outB;
    }
}