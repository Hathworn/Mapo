#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertFlowToRGBA_kernel(uchar4 *d_flowx_out, uchar4 *d_flowy_out, const float *d_flowx_in, const float *d_flowy_in, int width, int height, float lowerLim, float upperLim, float minMag) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x >= width || y >= height) return; // Early exit for threads outside the range
    
    uchar4 tempx, tempy;
    float ux = d_flowx_in[y * width + x];
    float uy = d_flowy_in[y * width + x];

    float mag = sqrtf(ux * ux + uy * uy);

    if (!isfinite(ux) || mag < minMag) {
        tempx = {255, 255, 255, 255};
        tempy = {255, 255, 255, 255};
    } else {
        // Rescale value from [lowerLim, upperLim] to [0,1]
        ux = (ux - lowerLim) / (upperLim - lowerLim);
        uy = (uy - lowerLim) / (upperLim - lowerLim);

        // Color calculation for ux
        float r = 1.0f, g = 1.0f, b = 1.0f;
        if (ux < 0.25f) {
            r = 0;
            g = 4.0f * ux;
        } else if (ux < 0.5f) {
            r = 0;
            b = 1.0 + 4.0f * (0.25f - ux);
        } else if (ux < 0.75f) {
            r = 4.0f * (ux - 0.5f);
            b = 0;
        } else {
            g = 1.0f + 4.0f * (0.75f - ux);
            b = 0;
        }
        tempx = {static_cast<unsigned char>(255.0f * r), static_cast<unsigned char>(255.0f * g), static_cast<unsigned char>(255.0f * b), 255};

        // Color calculation for uy
        r = 1.0f;
        g = 1.0f;
        b = 1.0f;
        if (uy < 0.25f) {
            r = 0;
            g = 4.0f * uy;
        } else if (uy < 0.5f) {
            r = 0;
            b = 1.0 + 4.0f * (0.25f - uy);
        } else if (uy < 0.75f) {
            r = 4.0f * (uy - 0.5f);
            b = 0;
        } else {
            g = 1.0f + 4.0f * (0.75f - uy);
            b = 0;
        }
        tempy = {static_cast<unsigned char>(255.0f * r), static_cast<unsigned char>(255.0f * g), static_cast<unsigned char>(255.0f * b), 255};
    }

    d_flowx_out[y * width + x] = tempx;
    d_flowy_out[y * width + x] = tempy;
}