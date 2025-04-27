#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TgvUpdateDualVariablesTGVKernel(float* u_, float2 *v_, float alpha0, float alpha1, float sigma, float eta_p, float eta_q, float* a, float* b, float* c, float4* grad_v, float2* p, float4* q, int width, int height, int stride)
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
            p[pos] = make_float2(0.0f, 0.0f);
            q[pos] = make_float4(0.0f, 0.0f, 0.0f, 0.0f);
        }
        else
        {
            // Pre-calculate multipliers to avoid repeated computation
            float alpha1_sigma_eta_p = alpha1 * sigma / eta_p;
            float alpha0_sigma_eta_q = alpha0 * sigma / eta_q;

            // Calculate boundary conditions safely
            int right = min(ix + 1, width - 1) + iy * stride;
            int down = ix + min(iy + 1, height - 1) * stride;
            int left = max(ix - 1, 0) + iy * stride;
            int up = ix + max(iy - 1, 0) * stride;

            // u_x and u_y calculations
            float u_x = u_[right] - u_[pos] - v_[pos].x;
            float u_y = u_[down] - u_[pos] - v_[pos].y;

            // du_tensor calculations
            float du_tensor_x = a[pos] * u_x + c[pos] * u_y;
            float du_tensor_y = c[pos] * u_x + b[pos] * u_y;

            // Update p
            p[pos].x += alpha1_sigma_eta_p * du_tensor_x;
            p[pos].y += alpha1_sigma_eta_p * du_tensor_y;

            // Projection for p
            float reprojection = fmaxf(1.0f, sqrtf(p[pos].x * p[pos].x + p[pos].y * p[pos].y));
            p[pos] /= reprojection;

            // grad_v calculations
            grad_v[pos].x = v_[right].x - v_[pos].x;
            grad_v[pos].y = v_[down].y - v_[pos].y;
            grad_v[pos].z = v_[down].x - v_[pos].x;
            grad_v[pos].w = v_[right].y - v_[pos].y;

            // Update q
            float4 gv = grad_v[pos];
            q[pos].x += alpha0_sigma_eta_q * gv.x;
            q[pos].y += alpha0_sigma_eta_q * gv.y;
            q[pos].z += alpha0_sigma_eta_q * gv.z;
            q[pos].w += alpha0_sigma_eta_q * gv.w;

            // Projection for q
            float reproject = fmaxf(1.0f, sqrtf(q[pos].x * q[pos].x + q[pos].y * q[pos].y + q[pos].z * q[pos].z + q[pos].w * q[pos].w));
            q[pos] /= reproject;
        }
    }
}