#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuConvertRGBToLABKernel(const float4* src, float4* dst, size_t stride, int width, int height, bool isNormalized)
{
    // Calculate the global index for the current thread
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int c = y * stride + x;

    if (x < width && y < height)
    {
        // Read input pixel
        float4 in = src[c];
        
        // Normalize RGB components if not already normalized
        if (!isNormalized)
        {
            in.x *= 0.003921569f; // Division by 255.0f
            in.y *= 0.003921569f; // Division by 255.0f
            in.z *= 0.003921569f; // Division by 255.0f
        }

        const float R = in.x;
        const float G = in.y;
        const float B = in.z;

        // Convert RGB to XYZ color space
        float4 XYZ;
        XYZ.x = 0.4124564f * R + 0.3575761f * G + 0.1804375f * B;
        XYZ.y = 0.2126729f * R + 0.7151522f * G + 0.0721750f * B;
        XYZ.z = 0.0193339f * R + 0.1191920f * G + 0.9503041f * B;

        // Normalize XYZ using D65 white point
        XYZ.x *= 1.0521267f; // Division by 0.950456f
        XYZ.z *= 0.9183173f; // Division by 1.088754f

        const float T1 = 0.008856f; // 216/24389
        const float T2 = 7.787f;    // 24389/27 = (24389/(27*116))

        // Compute L, a, b components using the cube root condition
        const float fx = (XYZ.x > T1) ? cbrtf(XYZ.x) : (T2 * XYZ.x + 0.137931); // Division by 116
        const float fy = (XYZ.y > T1) ? cbrtf(XYZ.y) : (T2 * XYZ.y + 0.137931); // Division by 116
        const float fz = (XYZ.z > T1) ? cbrtf(XYZ.z) : (T2 * XYZ.z + 0.137931); // Division by 116

        // Write resulting LAB pixel
        dst[c] = make_float4(116.0f * fy - 16.0f, 500.0f * (fx - fy), 200.0f * (fy - fz), in.w);
    }
}