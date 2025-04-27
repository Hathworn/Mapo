#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void TgvThresholdingL1MaskedKernel(float2* Tp, float* u_, float* Iu, float* Iz, float* mask, float lambda, float tau, float* eta_u, float* u, float* us, int width, int height, int stride)
{
    int iy = blockIdx.y * blockDim.y + threadIdx.y;   // current row
    int ix = blockIdx.x * blockDim.x + threadIdx.x;   // current column

    if (iy >= height || ix >= width) return;          // bounds check optimization
    int pos = ix + iy * stride;
    if (mask[pos] == 0.0f) return;                    // skip computation if mask is zero

    int right = (ix + 1) + iy * stride;
    int down = ix + (iy + 1) * stride;
    int left = (ix - 1) + iy * stride;
    int up = ix + (iy - 1) * stride;

    float maskRight = (ix + 1 < width) ? mask[right] : 0.0f;
    float maskLeft = (ix - 1 >= 0) ? mask[left] : 0.0f;
    float maskDown = (iy + 1 < height) ? mask[down] : 0.0f;
    float maskUp = (iy - 1 >= 0) ? mask[up] : 0.0f;

    // compute divergence of p
    float dxmTp = (maskLeft != 0.0f && maskRight != 0.0f) ? (Tp[pos].x - Tp[left].x) : 
                 (maskRight == 0.0f) ? -Tp[left].x : Tp[pos].x;

    float dymTp = (maskUp != 0.0f && maskDown != 0.0f) ? (Tp[pos].y - Tp[up].y) : 
                 (maskDown == 0.0f) ? -Tp[up].y : Tp[pos].y;

    float div_p = dxmTp + dymTp;

    // compute modified tau value
    float tau_eta_u = (eta_u[pos] == 0) ? tau : (tau / eta_u[pos]);

    // Thresholding
    float uhat = u_[pos] + tau_eta_u * div_p;
    float dun = (uhat - u[pos]);
    float Ius = Iu[pos];
    float rho = Ius * dun + Iz[pos];

    float upper = lambda * tau_eta_u * (Ius * Ius);
    float lower = -upper;
    float du = dun;

    if ((rho > upper)) {
        du -= lambda * tau_eta_u * Ius;
    } else if (rho < lower) {
        du += lambda * tau_eta_u * Ius;
    } else if (Ius != 0) {
        du -= rho / Ius;
    }

    us[pos] = u[pos] + du;
}