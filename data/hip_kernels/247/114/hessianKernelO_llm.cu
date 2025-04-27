#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float computeDeterminant(float e00, float e01, float e02, float e10, float e11, float e12, float e20, float e21, float e22) {
    return e00 * e11 * e22 - e00 * e12 * e21 + e10 * e21 * e02 - e10 * e01 * e22 + e20 * e01 * e12 - e20 * e11 * e02;
}

__global__ void hessianKernelO(float *d_output, float *d_output_theta, float *d_output_phi, const float *d_gxx, const float *d_gxy, const float *d_gxz, const float *d_gyy, const float *d_gyz, const float *d_gzz, float sigma, int imageW, int imageH, int imageD) {
    int n_blocks_per_width = imageW / blockDim.x;
    int z = blockIdx.x / n_blocks_per_width; // Simplified calculation for z
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int x = (blockIdx.x % n_blocks_per_width) * blockDim.x + threadIdx.x; // Simplified calculation for x
    int i = z * imageW * imageH + y * imageW + x;

    float a0 = -d_gxx[i];
    float b0 = -d_gxy[i];
    float c0 = -d_gxz[i];
    float d0 = -d_gyy[i];
    float e0 = -d_gyz[i];
    float f0 = -d_gzz[i];

    // Compute mean and determinant for eigenvalue calculation
    float m = (a0 + d0 + f0) / 3;
    float q = computeDeterminant(a0 - m, b0, c0, b0, d0 - m, e0, c0, e0, f0 - m) / 2;

    // Simplified computation of p using symmetry and removing redundancy
    float p = ((a0 - m) * (a0 - m) + 2 * b0 * b0 + 2 * c0 * c0 + (d0 - m) * (d0 - m) + 2 * e0 * e0 + (f0 - m) * (f0 - m)) / 6;

    float phi = 1.f / 3.f * atan(sqrt(p * p * p - q * q) / q);
    if (phi < 0) phi += 3.14159f / 3;

    float sqrt_p = sqrt(p); // Cache sqrt(p) for reuse
    float eig1 = m + 2 * sqrt_p * cos(phi);
    float eig2 = m - sqrt_p * (cos(phi) + sqrt(3.0f) * sin(phi));
    float eig3 = m - sqrt_p * (cos(phi) - sqrt(3.0f) * sin(phi));

    if (eig1 > eig2 && eig1 > eig3) d_output[i] = eig1 * sigma * sigma;
    else if (eig2 > eig1 && eig2 > eig3) d_output[i] = eig2 * sigma * sigma;
    else if (eig3 > eig2 && eig3 > eig1) d_output[i] = eig3 * sigma * sigma;

    // Eigenvector computation
    float l = d_output[i] / (sigma * sigma);
    a0 -= l; d0 -= l; f0 -= l;
    float xv = b0 * e0 - c0 * d0;
    float yv = e0 * a0 - c0 * b0;
    float zv = d0 * a0 - b0 * b0;
    float radius = sqrt(xv * xv + yv * yv + zv * zv);

    d_output_theta[i] = atan2(yv, xv);
    d_output_phi[i] = (radius > 1e-6f) ? acos(zv / radius) : 0;
}