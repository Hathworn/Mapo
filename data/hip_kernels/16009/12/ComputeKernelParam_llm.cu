#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeKernelParam( float3* __restrict__ kernelImg, int imgWidth, int imgHeight, int imgOutPitch, float Dth, float Dtr, float kDetail, float kDenoise, float kStretch, float kShrink)
{
    int pxX = blockIdx.x * blockDim.x + threadIdx.x;
    int pxY = blockIdx.y * blockDim.y + threadIdx.y;

    if (pxX >= imgWidth || pxY >= imgHeight)
        return;

    float3 grad = *(((float3*)((char*)kernelImg + imgOutPitch * pxY)) + pxX);
    float a11 = grad.x;
    float a22 = grad.y;
    float a12 = grad.z;

    // Optimized to avoid recalculating repeated expressions
    float a22_a11 = a22 - a11;
    float help = sqrtf(a22_a11 * a22_a11 + 4.0f * a12 * a12);

    float c = 2.0f * a12;
    float s = a22_a11 + help;

    float norm = sqrtf(c * c + s * s);
    if (norm > 0)
    {
        c /= norm;
        s /= norm;
    }
    else
    {
        c = 1;
        s = 0;
    }

    float lam1 = (a11 + a22 + help) * 0.5f;
    float lam2 = (a11 + a22 - help) * 0.5f;

    // Precompute constants to minimize operations
    float lam1_lam2 = lam1 + lam2;
    float A = 1 + sqrtf((lam1 - lam2) * (lam1 - lam2) / (lam1_lam2 * lam1_lam2));
    float D = 1 - sqrtf(lam1) / Dtr + Dth;
    D = fmaxf(fminf(1.0f, D), 0.0f);

    float A_kDetail = kDetail * A;
    float A_kDetail_kDenoise = kDetail * kDenoise;
    float k1h = kStretch * A_kDetail;
    float k2h = A_kDetail / kShrink;

    float k1 = ((1.0f - D) * k1h + D * A_kDetail_kDenoise);
    float k2 = ((1.0f - D) * k2h + D * A_kDetail_kDenoise);
    k1 *= k1; // Square terms for final calculation
    k2 *= k2;

    // Using intermediate variables to minimize computation
    float x1s = s;
    float x2s = c;
    float y1s = -c;
    float y2s = s;

    float b11 = k1 * x1s * x1s + x2s * x2s * k2;
    float b12 = k1 * x1s * y1s + x2s * y2s * k2;
    float b22 = k1 * y1s * y1s + y2s * y2s * k2;

    float det = b11 * b22 - b12 * b12 + 0.0000000001f;
    float3 kernel;
    kernel.x = b22 / det;
    kernel.y = b11 / det;
    kernel.z = -b12 / det;
    *(((float3*)((char*)kernelImg + imgOutPitch * pxY)) + pxX) = kernel;
}