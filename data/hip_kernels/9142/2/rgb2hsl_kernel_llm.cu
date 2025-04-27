#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rgb2hsl_kernel(int img_size, unsigned char *img_r, unsigned char *img_g, unsigned char *img_b, float *img_h, float *img_s, unsigned char *img_l)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    
    if (i >= img_size) return; // Check bounds to prevent out-of-bounds access

    float H, S, L;
    float var_r = ( (float)img_r[i] / 255.0f ); // Convert RGB to [0,1]
    float var_g = ( (float)img_g[i] / 255.0f );
    float var_b = ( (float)img_b[i] / 255.0f );

    // Compute min/max using fminf/fmaxf for better performance
    float var_min = fminf(var_r, fminf(var_g, var_b));
    float var_max = fmaxf(var_r, fmaxf(var_g, var_b));
    float del_max = var_max - var_min;

    L = (var_max + var_min) * 0.5f;
    if (del_max == 0.0f) // This is a gray, no chroma
    {
        H = 0.0f;
        S = 0.0f;
    }
    else // Chromatic data
    {
        S = (L < 0.5f) ? (del_max / (var_max + var_min)) : (del_max / (2.0f - var_max - var_min));

        float del_r = (((var_max - var_r) / 6.0f) + (del_max / 2.0f)) / del_max;
        float del_g = (((var_max - var_g) / 6.0f) + (del_max / 2.0f)) / del_max;
        float del_b = (((var_max - var_b) / 6.0f) + (del_max / 2.0f)) / del_max;

        if (var_r == var_max)
            H = del_b - del_g;
        else if (var_g == var_max)
            H = (1.0f / 3.0f) + del_r - del_b;
        else // var_b == var_max
            H = (2.0f / 3.0f) + del_g - del_r;
    }

    if (H < 0.0f) H += 1.0f;
    if (H > 1.0f) H -= 1.0f;

    img_h[i] = H;
    img_s[i] = S;
    img_l[i] = (unsigned char)(L * 255.0f);
}