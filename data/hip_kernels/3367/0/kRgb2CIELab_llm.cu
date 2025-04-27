```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kRgb2CIELab(const hipTextureObject_t texFrameBGRA, hipSurfaceObject_t surfFrameLab, int width, int height) {

    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;

    if (px < width && py < height) {
        uchar4 nPixel = tex2D<uchar4>(texFrameBGRA, px, py); // Fetch pixel

        // Normalize pixel values
        float _b = (float)nPixel.x / 255.0f;
        float _g = (float)nPixel.y / 255.0f;
        float _r = (float)nPixel.z / 255.0f;

        // Convert RGB to XYZ color space
        float x = _r * 0.412453f + _g * 0.357580f + _b * 0.180423f;
        float y = _r * 0.212671f + _g * 0.715160f + _b * 0.072169f;
        float z = _r * 0.019334f + _g * 0.119193f + _b * 0.950227f;

        x /= 0.950456f;
        z /= 1.088754f;

        // Use a function to simplify the gamma correction step
        auto gammaCorrection = [](float value) {
            return (value > 0.008856f) ? cbrtf(value) : (7.787f * value + 0.13793f);
        };

        float fx = gammaCorrection(x);
        float fy = gammaCorrection(y);
        float fz = gammaCorrection(z);

        // Calculate L, a, b values
        float l = y > 0.008856f ? (116.0f * fy - 16.0f) : 903.3f * y;
        float a = (fx - fy) * 500.0f;
        float b = (fy - fz) * 200.0f;

        float4 fPixel;
        fPixel.x = l;
        fPixel.y = a;
        fPixel.z = b;
        fPixel.w = 0.0f;

        // Write output
        surf2Dwrite(fPixel, surfFrameLab, px * sizeof(float4), py);
    }
}