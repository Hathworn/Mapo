#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kRgb2CIELab(const hipTextureObject_t texFrameBGRA, hipSurfaceObject_t surfFrameLab, int width, int height) {

    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;

    if (px < width && py < height) {
        uchar4 nPixel = tex2D<uchar4>(texFrameBGRA, px, py); // Fetch pixel

        // Normalize RGB values
        float _r = nPixel.z / 255.0f;
        float _g = nPixel.y / 255.0f;
        float _b = nPixel.x / 255.0f;

        // Convert RGB to XYZ
        float x = _r * 0.412453f + _g * 0.357580f + _b * 0.180423f;
        float y = _r * 0.212671f + _g * 0.715160f + _b * 0.072169f;
        float z = _r * 0.019334f + _g * 0.119193f + _b * 0.950227f;

        // Normalize for D65 illumination
        x /= 0.950456f;
        z /= 1.088754f;

        // Convert XYZ to CIELab
        float y3 = cbrtf(y);
        x = (x > 0.008856f) ? cbrtf(x) : (7.787f * x + 0.137931034f);
        y = (y > 0.008856f) ? y3 : (7.787f * y + 0.137931034f);
        z = (z > 0.008856f) ? cbrtf(z) : (7.787f * z + 0.137931034f);

        float l = (y > 0.008856f) ? (116.0f * y3 - 16.0f) : (903.3f * y);
        float a = (x - y) * 500.0f;
        float b = (y - z) * 200.0f;

        // Write back to surface object
        float4 fPixel;
        fPixel.x = l;
        fPixel.y = a;
        fPixel.z = b;
        fPixel.w = 0.0f;

        surf2Dwrite(fPixel, surfFrameLab, px * sizeof(float4), py); // Correct stride based on float4 size
    }
}