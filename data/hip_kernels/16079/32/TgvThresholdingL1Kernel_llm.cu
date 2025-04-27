#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void TgvThresholdingL1Kernel(float2* Tp, float* u_, float* Iu, float* Iz, float lambda, float tau, float* eta_u, float* u, float* us, int width, int height, int stride)
{
    int iy = blockIdx.y * blockDim.y + threadIdx.y; // current row
    int ix = blockIdx.x * blockDim.x + threadIdx.x; // current column

    float desiredRadius = (float)width / 2.20f;
    float halfWidth = (float)width / 2.0f;
    float halfHeight = (float)height / 2.0f;
    float radius = sqrtf((iy - halfHeight) * (iy - halfHeight) + (ix - halfWidth) * (ix - halfWidth));

    if ((iy < height) && (ix < width))
    {
        int pos = ix + iy * stride;
        if (radius >= desiredRadius)
        {
            us[pos] = 0.0f;
        }
        else
        {
            int left = (ix - 1) + iy * stride;
            int up = ix + (iy - 1) * stride;

            // Calculate divergence of p using conditional assignments
            float dxmTp = (ix > 0) ? (Tp[pos].x - Tp[left].x) : Tp[pos].x;
            float dymTp = (iy > 0) ? (Tp[pos].y - Tp[up].y) : Tp[pos].y;
            float div_p = dxmTp + dymTp;

            // Calculate tau_eta_u using ternary operator
            float tau_eta_u = (eta_u[pos] == 0) ? tau : (tau / eta_u[pos]);

            // Thresholding
            float uhat = u_[pos] + tau_eta_u * div_p;
            float dun = (uhat - u[pos]);
            float Ius = Iu[pos];
            float rho = Ius * dun + Iz[pos];
            float scaledLambdaTau = lambda * tau_eta_u * (Ius * Ius);
            
            // Simplify conditionals using inequalities
            float du = dun;
            if (rho < -scaledLambdaTau)
            {
                du += lambda * tau_eta_u * Ius;
            }
            else if (rho > scaledLambdaTau)
            {
                du -= lambda * tau_eta_u * Ius;
            }
            else if (Ius != 0)
            {
                du -= rho / Ius;
            }

            us[pos] = u[pos] + du;
        }
    }
}