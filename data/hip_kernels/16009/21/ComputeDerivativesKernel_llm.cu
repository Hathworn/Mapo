#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeDerivativesKernel(int width, int height, int stride, float* Ix, float* Iy, float* Iz, hipTextureObject_t texSource, hipTextureObject_t texTarget)
{
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;
    const int iy = threadIdx.y + blockIdx.y * blockDim.y;

    if (ix >= width || iy >= height) return;

    float dx = 1.0f / (float)width;
    float dy = 1.0f / (float)height;

    float x = ((float)ix + 0.5f) * dx;
    float y = ((float)iy + 0.5f) * dy;

    // Precompute texture coordinates to reduce redundant calculations
    float x_dx2 = x + 2.0f * dx;
    float x_dx1 = x + 1.0f * dx;
    float x_ndx1 = x - 1.0f * dx;
    float x_ndx2 = x - 2.0f * dx;

    float y_dy2 = y + 2.0f * dy;
    float y_dy1 = y + 1.0f * dy;
    float y_ndy1 = y - 1.0f * dy;
    float y_ndy2 = y - 2.0f * dy;

    float t0, t1;
    
    // x derivative
    t0 = tex2D<float>(texSource, x_dx2, y);
    t1 = tex2D<float>(texTarget, x_dx2, y);
    t0 -= tex2D<float>(texSource, x_dx1, y) * 8.0f;
    t1 -= tex2D<float>(texTarget, x_dx1, y) * 8.0f;
    t0 += tex2D<float>(texSource, x_ndx1, y) * 8.0f;
    t1 += tex2D<float>(texTarget, x_ndx1, y) * 8.0f;
    t0 -= tex2D<float>(texSource, x_ndx2, y);
    t1 -= tex2D<float>(texTarget, x_ndx2, y);
    t0 /= 12.0f;
    t1 /= 12.0f;
    
    // Store x derivative result
    *(((float*)((char*)Ix + stride * iy)) + ix) = (t0 + t1) * 0.5f;

    // t derivative
    *(((float*)((char*)Iz + stride * iy)) + ix) = tex2D<float>(texSource, x, y) - tex2D<float>(texTarget, x, y);

    // y derivative
    t0 = tex2D<float>(texSource, x, y_dy2);
    t1 = tex2D<float>(texTarget, x, y_dy2);
    t0 -= tex2D<float>(texSource, x, y_dy1) * 8.0f;
    t1 -= tex2D<float>(texTarget, x, y_dy1) * 8.0f;
    t0 += tex2D<float>(texSource, x, y_ndy1) * 8.0f;
    t1 += tex2D<float>(texTarget, x, y_ndy1) * 8.0f;
    t0 -= tex2D<float>(texSource, x, y_ndy2);
    t1 -= tex2D<float>(texTarget, x, y_ndy2);
    t0 /= 12.0f;
    t1 /= 12.0f;
    
    // Store y derivative result
    *(((float*)((char*)Iy + stride * iy)) + ix) = (t0 + t1) * 0.5f;
}