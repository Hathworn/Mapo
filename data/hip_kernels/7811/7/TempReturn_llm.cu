#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void Temp(float* R, float* G, float* B, float Temp) {
    float r, g, b;
    if (Temp <= 66.0f) {
        r = 255.0f;
    } else {
        r = Temp - 60.0f;
        r = 329.698727446 * powf(r, -0.1332047592);
        r = fminf(fmaxf(r, 0.0f), 255.0f); // clamp r between 0.0 and 255.0
    }
    if (Temp <= 66.0f) {
        g = Temp;
        g = 99.4708025861 * logf(g) - 161.1195681661;
        g = fminf(fmaxf(g, 0.0f), 255.0f); // clamp g between 0.0 and 255.0
    } else {
        g = Temp - 60.0f;
        g = 288.1221695283 * powf(g, -0.0755148492);
        g = fminf(fmaxf(g, 0.0f), 255.0f); // clamp g between 0.0 and 255.0
    }
    if (Temp >= 66.0f) {
        b = 255.0f;
    } else {
        if (Temp <= 19.0f) {
            b = 0.0f;
        } else {
            b = Temp - 10.0f;
            b = 138.5177312231 * logf(b) - 305.0447927307;
            b = fminf(fmaxf(b, 0.0f), 255.0f); // clamp b between 0.0 and 255.0
        }
    }
    *R = r / 255.0f;
    *G = g / 255.0f;
    *B = b / 255.0f;
}

__global__ void TempReturn(float* p_Input, float* p_Temp, int p_Width, int p_Height) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    if ((x < p_Width) && (y < p_Height)) {
        const int index = (y * p_Width + x) * 4;
        p_Input[index + 2] = p_Temp[y * p_Width + x];
    }
}