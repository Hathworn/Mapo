```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float computeDeterminant(float e00, float e01, float e02, float e10, float e11, float e12, float e20, float e21, float e22) {
    return e00 * e11 * e22 - e00 * e12 * e21 + e10 * e21 * e02 - e10 * e01 * e22 + e20 * e01 * e12 - e20 * e11 * e02;
}

__global__ void hessianKernel(float *d_output, const float *d_gxx, const float *d_gxy, const float *d_gxz, const float *d_gyy, const float *d_gyz, const float *d_gzz, float sigma, int imageW, int imageH, int imageD) {
    int n_blocks_per_width = imageW / blockDim.x;
    int z = blockIdx.x / n_blocks_per_width; // Utilize integer division
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int x = (blockIdx.x % n_blocks_per_width) * blockDim.x + threadIdx.x; // Use modulus for x calculation
    int i = z * imageW * imageH + y * imageW + x;

    if (x >= imageW || y >= imageH || z >= imageD) return; // Boundary check

    // Preload negative gradients for efficiency
    float a0 = -d_gxx[i], b0 = -d_gxy[i], c0 = -d_gxz[i], e0 = -d_gyy[i], f0 = -d_gyz[i], k0 = -d_gzz[i];

    // Oliver K. Smith eigenvalue algorithm
    float m = (a0 + e0 + k0) / 3.f;
    float q = computeDeterminant(a0 - m, b0, c0, b0, e0 - m, f0, c0, f0, k0 - m) / 2.f;
    float p = ((a0 - m) * (a0 - m) + 2 * (b0 * b0 + c0 * c0 + f0 * f0) + (e0 - m) * (e0 - m) + (k0 - m) * (k0 - m)) / 6.f;
    float sqrt_p = sqrt(p); // Compute square root of p once
    float phi = atan(sqrt_p * sqrt_p * sqrt_p - q * q) / (3.f * q);
    if (phi < 0) phi += 3.14159f / 3.f;

    // Calculate eigenvalues
    float cos_phi = cos(phi);
    float sin_phi = sin(phi);
    float eig1 = m + 2.f * sqrt_p * cos_phi;
    float eig2 = m - sqrt_p * (cos_phi + sqrt(3.0f) * sin_phi);
    float eig3 = m - sqrt_p * (cos_phi - sqrt(3.0f) * sin_phi);

    // Determine the maximum eigenvalue and update the output
    float max_eig = fmaxf(fmaxf(eig1, eig2), eig3);
    d_output[i] = max_eig * sigma * sigma;
}