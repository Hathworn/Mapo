#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rgb2yuv_gpu_son(unsigned char * d_r, unsigned char * d_g, unsigned char * d_b, unsigned char * d_y , unsigned char * d_u ,unsigned char * d_v , int size)
{
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    if (x >= size) return;
    
    // Utilize direct memory coalescing for increased access efficiency
    unsigned char r = d_r[x];
    unsigned char g = d_g[x];
    unsigned char b = d_b[x];

    // Precompute constant multiplications
    float y_coeff_r = 0.299f, y_coeff_g = 0.587f, y_coeff_b = 0.114f;
    float u_coeff_r = -0.169f, u_coeff_g = -0.331f, u_coeff_b = 0.499f;
    float v_coeff_r = 0.499f, v_coeff_g = -0.418f, v_coeff_b = -0.0813f;

    d_y[x] = (unsigned char)(y_coeff_r * r + y_coeff_g * g + y_coeff_b * b);
    d_u[x] = (unsigned char)(u_coeff_r * r + u_coeff_g * g + u_coeff_b * b + 128.0f);
    d_v[x] = (unsigned char)(v_coeff_r * r + v_coeff_g * g + v_coeff_b * b + 128.0f);
}