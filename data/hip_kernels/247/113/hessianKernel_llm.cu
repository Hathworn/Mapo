#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float computeDeterminant (float e00, float e01, float e02, float e10, float e11, float e12, float e20, float e21, float e22)
{
    return e00*e11*e22 - e00*e12*e21 + e10*e21*e02 - e10*e01*e22 + e20*e01*e12 - e20*e11*e02;
}

__global__ void hessianKernel (float *d_output, const float *d_gxx, const float *d_gxy, const float *d_gxz, const float *d_gyy, const float *d_gyz, const float *d_gzz, float sigma, int imageW, int imageH, int imageD)
{
    int n_blocks_per_width = imageW / blockDim.x;
    int z = blockIdx.x / n_blocks_per_width; // Simplified integer division
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int x = (blockIdx.x % n_blocks_per_width) * blockDim.x + threadIdx.x; // Use modulus for calculation
    int i = z * imageW * imageH + y * imageW + x;

    float a0 = -d_gxx[i], b0 = -d_gxy[i], c0 = -d_gxz[i];
    float e0 = -d_gyy[i], f0 = -d_gyz[i], k0 = -d_gzz[i];

    float m = (a0 + e0 + k0) / 3;
    float q = computeDeterminant(a0-m, b0, c0, b0, e0-m, f0, c0, f0, k0-m) / 2;
    float p = (a0-m)*(a0-m) + 2*(b0*b0 + c0*c0 + f0*f0) + (e0-m)*(e0-m) + (k0-m)*(k0-m);
    p /= 6;
    float phi = 1.0f/3.0f * acos(clamp(q / sqrt(p*p*p), -1.0f, 1.0f));

    float sqrtP = sqrt(p);
    float eig1 = m + 2 * sqrtP * cos(phi);
    float eig2 = m - sqrtP * (cos(phi) + sqrt(3.0f) * sin(phi));
    float eig3 = m - sqrtP * (cos(phi) - sqrt(3.0f) * sin(phi));

    float maxEig = fmaxf(fmaxf(eig1, eig2), eig3); // Calculate max eigenvalue
    d_output[i] = maxEig * sigma * sigma;
}