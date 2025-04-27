#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dual(float* p1, float* p2, const float* u_, const double lambda, const double sigma, const int X, const int Y)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within bounds
    if (x >= X || y >= Y) return;

    // Center point
    int c = y * X + x;

    float nabla_x = 0.0f;
    float nabla_y = 0.0f;

    // Compute differences if within valid range
    if (x < X - 1) nabla_x = u_[c + 1] - u_[c];
    if (y < Y - 1) nabla_y = u_[c + X] - u_[c];

    // Update p1 and p2
    p1[c] += sigma * nabla_x;
    p2[c] += sigma * nabla_y;

    // Normalization
    float denom = fmaxf(1.0f, sqrtf(p1[c] * p1[c] + p2[c] * p2[c]) / lambda);
    p1[c] /= denom;
    p2[c] /= denom;
}