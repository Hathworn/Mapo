#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_colorRampHeatMapUnsat(uchar3 * colored, const float * vals, const int width, const int height, const float minVal, const float maxVal) {

    // Calculate the x and y coordinates for the current thread
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Return if the thread is out of bounds
    if (x >= width || y >= height) {
        return;
    }

    const int index = x + y * width;
    uchar3 & imgVal = colored[index];

    // Check for NaN and set color to white
    if (isnan(vals[index])) {
        imgVal = make_uchar3(255, 255, 255);
        return;
    }

    const float normVal = fmaxf(0, fminf((vals[index] - minVal) / (maxVal - minVal), 1));
    const float t = normVal == 1.0f ? 1.0f : fmodf(normVal, 0.25f) * 4.0f;
    
    // Predefined color ramp values for different ranges
    uchar3 colors[4] = {
        make_uchar3(0x18, 0x62, 0x93),
        make_uchar3(32, 191, 139),
        make_uchar3(241, 232, 137),
        make_uchar3(198, 132, 63),
        make_uchar3(0xc0, 0x43, 0x36)
    };

    uchar3 a, b;
    if (normVal < 0.25f) {
        a = colors[0]; b = colors[1];
    } else if (normVal < 0.5f) {
        a = colors[1]; b = colors[2];
    } else if (normVal < 0.75f) {
        a = colors[2]; b = colors[3];
    } else {
        a = colors[3]; b = colors[4];
    }

    // Interpolate colors and assign to imgVal
    imgVal = make_uchar3((1 - t) * a.x + t * b.x,
                         (1 - t) * a.y + t * b.y,
                         (1 - t) * a.z + t * b.z);
}