#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuConvertHSVToRGBKernel(const float4* src, float4* dst, size_t stride, int width, int height, bool denormalize)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Calculate x coordinate within the grid
    const int y = blockIdx.y * blockDim.y + threadIdx.y; // Calculate y coordinate within the grid
    
    int c = y * stride + x; // Calculate linear index of the pixel
    
    if (x < width && y < height)
    {
        // Read HSV values
        float4 in = src[c];
        float H = in.x;
        float S = in.y;
        float V = in.z;

        float4 rgb = make_float4(0.0f, 0.0f, 0.0f, 0.0f);

        // If saturation is zero, it's a gray-scale pixel
        if (S == 0) 
        {
            rgb = make_float4(V, V, V, in.w); // Directly use V for RGB components
            dst[c] = rgb; // Write back and return early
            return;
        }

        // Normalize hue
        H /= 60.0f;
        int i = floor(H); // Determine the color sector
        float f = H - i; // Calculate intermediate value
        float p = V * (1.0f - S); // Intermediate value p
        float q = V * (1.0f - S * f); // Intermediate value q
        float t = V * (1.0f - S * (1.0f - f)); // Intermediate value t

        // Conditional assignments based on color sector
        if (i == 0)
            rgb = make_float4(V, t, p, in.w);
        else if (i == 1)
            rgb = make_float4(q, V, p, in.w);
        else if (i == 2)
            rgb = make_float4(p, V, t, in.w);
        else if (i == 3)
            rgb = make_float4(p, q, V, in.w);
        else if (i == 4)
            rgb = make_float4(t, p, V, in.w);
        else if (i == 5)
            rgb = make_float4(V, p, q, in.w);

        // Write Back
        rgb.w = in.w; // Preserve alpha channel
        dst[c] = rgb; // Store the converted RGB values
    }
}