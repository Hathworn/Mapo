#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuConvertRGBToHSVKernel(const float4* src, float4* dst, size_t stride, int width, int height, bool normalize)
{
    // Calculate pixel position
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int c = y * stride + x;

    if (x < width && y < height)
    {
        // Read input color
        float4 in = src[c];
        float R = in.x;
        float G = in.y;
        float B = in.z;

        // Calculate max, min, and delta
        float Ma = fmaxf(R, fmaxf(G, B));
        float mi = fminf(R, fminf(G, B));
        float C = Ma - mi;

        // Initialize Hue, Saturation, Value
        float H = 0.0f;
        float S = 0.0f;
        float V = Ma;

        // Compute Hue
        if (C != 0.0f)
        {
            if (Ma == R)
                H = fmodf((G - B) / C, 6.0f);
            else if (Ma == G)
                H = (B - R) / C + 2.0f;
            else
                H = (R - G) / C + 4.0f;
            
            H *= 60.0f;
            if (H < 0.0f)
                H += 360.0f;
            
            // Compute Saturation
            S = C / V;

            // Normalize if required
            if (normalize)
                H /= 360.0f;
        }

        // Write converted HSV to destination
        dst[c] = make_float4(H, S, V, in.w);
    }
}