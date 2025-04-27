```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TgvConvertKBKernel(float2* disparity, float focalx, float focaly, float cx, float cy, float d1, float d2, float d3, float d4, float t1, float t2, float t3, float3* X, float* depth, int width, int height, int stride)
{
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;
    const int iy = threadIdx.y + blockIdx.y * blockDim.y;

    const int pos = ix + iy * stride;

    if (ix >= width || iy >= height) return;

    float u0 = (float)ix;
    float v0 = (float)iy;
    float xprime0 = (u0 - focalx) / cx;
    float yprime0 = (v0 - focaly) / cy;

    float u = disparity[pos].x;
    float v = disparity[pos].y;

    float u1 = u0 + u;
    float v1 = v0 + v;
    float xprime1 = (u1 - focalx) / cx;
    float yprime1 = (v1 - focaly) / cy;

    // Newton-Raphson Method Frame 0
    float ru0 = sqrtf(xprime0 * xprime0 + yprime0 * yprime0);
    float theta0 = 0.0f;

    // Precompute powers of theta0 to avoid repeated calculations
    float theta0_2 = theta0 * theta0;
    float theta0_4 = theta0_2 * theta0_2;
    float theta0_6 = theta0_4 * theta0_2;
    float theta0_8 = theta0_4 * theta0_4;

    for (int iter = 0; iter < 5; iter++) {
        float thetad0 = theta0 + d1 * theta0_2 * theta0 + d2 * theta0_4 * theta0 + d3 * theta0_6 * theta0 + d4 * theta0_8 * theta0;
        float Dthetad0 = 1.0f + 3.0f * d1 * theta0_2 + 5.0f * d2 * theta0_4 + 7.0f * d3 * theta0_6 + 9.0f * d4 * theta0_8;
        float f0 = ru0 - thetad0;
        float f0prime = -Dthetad0;
        theta0 -= f0 / f0prime;
        
        // Update precomputed values
        theta0_2 = theta0 * theta0;
        theta0_4 = theta0_2 * theta0_2;
        theta0_6 = theta0_4 * theta0_2;
        theta0_8 = theta0_4 * theta0_4;
    }
    
    float x0out = tanf(theta0) * xprime0 / ru0;
    float y0out = tanf(theta0) * yprime0 / ru0;

    // Newton-Raphson Method Frame 1
    float ru1 = sqrtf(xprime1 * xprime1 + yprime1 * yprime1);
    float theta1 = 0.0f;

    // Precompute powers of theta1 to avoid repeated calculations
    float theta1_2 = theta1 * theta1;
    float theta1_4 = theta1_2 * theta1_2;
    float theta1_6 = theta1_4 * theta1_2;
    float theta1_8 = theta1_4 * theta1_4;

    for (int iter = 0; iter < 5; iter++) {
        float thetad1 = theta1 + d1 * theta1_2 * theta1 + d2 * theta1_4 * theta1 + d3 * theta1_6 * theta1 + d4 * theta1_8 * theta1;
        float Dthetad1 = 1.0f + 3.0f * d1 * theta1_2 + 5.0f * d2 * theta1_4 + 7.0f * d3 * theta1_6 + 9.0f * d4 * theta1_8;
        float f1 = ru1 - thetad1;
        float f1prime = -Dthetad1;
        theta1 -= f1 / f1prime;

        // Update precomputed values
        theta1_2 = theta1 * theta1;
        theta1_4 = theta1_2 * theta1_2;
        theta1_6 = theta1_4 * theta1_2;
        theta1_8 = theta1_4 * theta1_4;
    }
    
    float x1out = tanf(theta1) * xprime1 / ru1;
    float y1out = tanf(theta1) * yprime1 / ru1;

    // Triangulation
    float Zx = (t1 - x1out * t3) / (x1out - x0out);
    float Zy = (t2 - y1out * t3) / (y1out - y0out);
    float Z = Zx;

    X[pos].x = x0out * Z;
    X[pos].y = y0out * Z;
    X[pos].z = Z;
    
    depth[pos] = sqrt(X[pos].x * X[pos].x + X[pos].y * X[pos].y + X[pos].z * X[pos].z);
}