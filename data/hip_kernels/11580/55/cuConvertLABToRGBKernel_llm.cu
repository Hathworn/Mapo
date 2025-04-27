#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuConvertLABToRGBKernel(const float4* __restrict__ src, float4* __restrict__ dst, size_t stride, int width, int height)
{
    // Calculate global thread coordinates
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int c = y * stride + x;

    // Process only if within image bounds
    if (x < width && y < height)
    {
        // Read source data
        float4 in = src[c];

        float L = in.x;
        float a = in.y;
        float b = in.z;

        // Convert to XYZ
        const float T1 = cbrtf(216 / 24389.0f);
        const float fy = (L + 16) / 116.0f;

        float4 XYZ;
        if (L > 8)
            XYZ.y = fy * fy * fy;
        else
            XYZ.y = L / (24389 / 27.0f);

        float fx = a / 500.0f + fy;
        if (fx > T1)
            XYZ.x = fx * fx * fx;
        else
            XYZ.x = (116 * fx - 16) / (24389 / 27.0f);

        float fz = fy - b / 200.0f;
        if (fz > T1)
            XYZ.z = fz * fz * fz;
        else
            XYZ.z = (116 * fz - 16) / (24389 / 27.0f);

        // Normalize for D65 white point
        XYZ.x *= 0.950456f;
        XYZ.z *= 1.088754f;

        // Linear transformation to RGB
        float4 rgb;
        rgb.x = fmaf(3.2404542f, XYZ.x, fmaf(-1.5371385f, XYZ.y, -0.4985314f * XYZ.z));
        rgb.y = fmaf(-0.9692660f, XYZ.x, fmaf(1.8760108f, XYZ.y, 0.0415560f * XYZ.z));
        rgb.z = fmaf(0.0556434f, XYZ.x, fmaf(-0.2040259f, XYZ.y, 1.0572252f * XYZ.z));
        rgb.w = in.w;

        // Write to destination
        dst[c] = rgb;
    }
}