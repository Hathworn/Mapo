#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float computeDeterminant(float e00, float e01, float e02, float e10, float e11, float e12, float e20, float e21, float e22) {
    return e00 * e11 * e22 - e00 * e12 * e21 + e10 * e21 * e02 - e10 * e01 * e22 + e20 * e01 * e12 - e20 * e11 * e02;
}

__global__ void hessianKernelO(float *d_output, float *d_output_theta, float *d_output_phi, const float *d_gxx, const float *d_gxy, const float *d_gxz, const float *d_gyy, const float *d_gyz, const float *d_gzz, float sigma, int imageW, int imageH, int imageD) {
    int n_blocks_per_width = imageW / blockDim.x;
    int z = blockIdx.x / n_blocks_per_width;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int x = (blockIdx.x - z * n_blocks_per_width) * blockDim.x + threadIdx.x;
    int i = z * imageW * imageH + y * imageW + x;

    if (x >= imageW || y >= imageH || z >= imageD)
        return;  // Boundary condition check

    float a0, b0, c0, d0, e0, f0;
    a0 = -d_gxx[i]; b0 = -d_gxy[i]; c0 = -d_gxz[i];
    d0 = -d_gyy[i]; e0 = -d_gyz[i]; f0 = -d_gzz[i];

    float m = (a0 + d0 + f0) / 3;
    float p = (a0 - m) * (a0 - m) + 2 * b0 * b0 + 2 * c0 * c0 + (d0 - m) * (d0 - m) + 2 * e0 * e0 + (f0 - m) * (f0 - m);
    p = p / 6;
    
    float q = computeDeterminant(a0 - m, b0, c0, b0, d0 - m, e0, c0, e0, f0 - m) / 2;
    float phi = (1.f / 3.f) * atan2(sqrtf(p * p * p - q * q), q);
    
    float cosPhi = cos(phi), sinPhi = sin(phi);
    float sqrtP = sqrtf(p);

    float eig1 = m + 2 * sqrtP * cosPhi;
    float eig2 = m - sqrtP * (cosPhi + sqrtf(3.0f) * sinPhi);
    float eig3 = m - sqrtP * (cosPhi - sqrtf(3.0f) * sinPhi);

    // Use fmaxf for selecting the maximum eigenvalue
    float maxEig = fmaxf(fmaxf(eig1, eig2), eig3);
    d_output[i] = maxEig * sigma * sigma;

    // Compute the eigenvector
    float l = maxEig / (sigma * sigma);
    a0 -= l;
    d0 -= l;
    f0 -= l;

    float xv = b0 * e0 - c0 * d0;
    float yv = e0 * a0 - c0 * b0;
    float zv = d0 * a0 - b0 * b0;
    float radius = sqrtf(xv * xv + yv * yv + zv * zv);
    float thetav = atan2f(yv, xv);

    float phiv = 0;
    if(radius > 1e-6f)
        phiv = acosf(zv / radius);

    d_output_theta[i] = thetav;
    d_output_phi[i] = phiv;
}