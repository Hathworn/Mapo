#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_colorRampHeatMapUnsat(uchar4 * colored, const float * vals, const int width, const int height, const float minVal, const float maxVal) {

    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit if outside image bounds.
    if (x >= width || y >= height) return;

    const int index = x + y * width;
    uchar4 & imgVal = colored[index];

    // Handle NaN values.
    if (isnan(vals[index])) {
        imgVal = make_uchar4(0, 0, 0, 0);
        return;
    }

    // Normalize value in range 0 to 1.
    const float normVal = fmaxf(0, fminf((vals[index] - minVal) / (maxVal - minVal), 1));
    
    uchar3 a, b;

    // Assign colors based on normalized value range.
    if (normVal < 0.25f) {
        b = make_uchar3(32, 191, 139);
        a = make_uchar3(0x18, 0x62, 0x93);
    } else if (normVal < 0.5f) {
        b = make_uchar3(241, 232, 137);
        a = make_uchar3(32, 191, 139);
    } else if (normVal < 0.75f) {
        b = make_uchar3(198, 132, 63);
        a = make_uchar3(241, 232, 137);
    } else {
        b = make_uchar3(0xc0, 0x43, 0x36);
        a = make_uchar3(198, 132, 63);
    }

    // Calculate interpolation factor.
    const float t = (normVal < 1.0f) ? fmodf(normVal, 0.25f) * 4.0f : 1.0f;

    // Linearly interpolate between colors a and b.
    imgVal = make_uchar4(
                __float2int_rn((1.0f - t) * a.x + t * b.x),
                __float2int_rn((1.0f - t) * a.y + t * b.y),
                __float2int_rn((1.0f - t) * a.z + t * b.z),
                255);
}