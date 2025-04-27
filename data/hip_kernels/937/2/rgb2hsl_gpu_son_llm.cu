#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rgb2hsl_gpu_son(unsigned char *d_r, unsigned char *d_g, unsigned char *d_b, float *d_h, float *d_s, unsigned char *d_l, int size) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    if (x >= size) return;

    // Load RGB values and normalize to [0,1]
    float var_r = d_r[x] / 255.0f;
    float var_g = d_g[x] / 255.0f;
    float var_b = d_b[x] / 255.0f;
    
    // Calculate min and max RGB values
    float var_min = fminf(fminf(var_r, var_g), var_b);
    float var_max = fmaxf(fmaxf(var_r, var_g), var_b);
    float del_max = var_max - var_min;
    
    // Calculate luminance
    float L = (var_max + var_min) / 2.0f;

    float H = 0.0f, S = 0.0f;
    if (del_max != 0.0f) { // Chromatic (not gray)
        // Compute saturation
        S = (L < 0.5f) ? (del_max / (var_max + var_min)) : (del_max / (2.0f - var_max - var_min));

        // Compute hue
        float del_r = (((var_max - var_r) / 6.0f) + (del_max / 2.0f)) / del_max;
        float del_g = (((var_max - var_g) / 6.0f) + (del_max / 2.0f)) / del_max;
        float del_b = (((var_max - var_b) / 6.0f) + (del_max / 2.0f)) / del_max;
        if (var_r == var_max) H = del_b - del_g;
        else if (var_g == var_max) H = (1.0f / 3.0f) + del_r - del_b;
        else H = (2.0f / 3.0f) + del_g - del_r;

        if (H < 0.0f) H += 1.0f;
        if (H > 1.0f) H -= 1.0f;
    }

    // Store results back
    d_h[x] = H;
    d_s[x] = S;
    d_l[x] = static_cast<unsigned char>(L * 255.0f);
}