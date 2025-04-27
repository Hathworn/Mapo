#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TgvSolveEtaMaskedKernel(float* mask, float alpha0, float alpha1, float* atensor, float *btensor, float* ctensor, float* etau, float* etav1, float* etav2, int width, int height, int stride)
{
    int iy = blockIdx.y * blockDim.y + threadIdx.y;  // current row
    int ix = blockIdx.x * blockDim.x + threadIdx.x;  // current column

    // Ensure indices are within bounds
    if (iy >= height || ix >= width) return;

    int pos = ix + iy * stride;
    
    // Check mask condition early
    if (mask[pos] == 0.0f) return;

    float a = atensor[pos];
    float b = btensor[pos];
    float c = ctensor[pos];

    // Precompute reusable expressions
    float alpha1_sq = alpha1 * alpha1;
    float alpha0_sq_4 = 4 * alpha0 * alpha0;
    float a_plus_c = a + c;
    float b_plus_c = b + c;
    
    // Combined computation
    etau[pos] = (a * a + b * b + 2 * c * c + a_plus_c * a_plus_c + b_plus_c * b_plus_c) * alpha1_sq;
    etav1[pos] = (alpha1_sq * (b * b + c * c)) + alpha0_sq_4;
    etav2[pos] = (alpha1_sq * (a * a + c * c)) + alpha0_sq_4;
}