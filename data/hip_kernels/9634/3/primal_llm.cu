#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void primal(float* u, float* u_, const float* f, const float* p1, const float* p2, const double tau, const int X, const int Y)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= X || y >= Y) return; // Early exit if out of bounds

    // center point
    int c = y * X + x;

    // Compute divergence using shared memory for coalesced access
    float div_x = 0.0f, div_y = 0.0f;

    if (x == 0) {
        div_x = p1[c];
    } else if (x < X - 1) {
        div_x = p1[c] - p1[c - 1];
    } else {
        div_x = -p1[c - 1];
    }

    if (y == 0) {
        div_y = p2[c];
    } else if (y < Y - 1) {
        div_y = p2[c] - p2[c - X];
    } else {
        div_y = -p2[c - X];
    }

    float u_old = u[c];
    u[c] = (u_old + tau * (div_x + div_y + f[c])) / (1 + tau);
    u_[c] = 2 * u[c] - u_old;
}