#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TgvUpdateDualVariablesTGVMaskedKernel(float* mask, float* u_, float2 *v_, float alpha0, float alpha1, float sigma, float eta_p, float eta_q, float* a, float* b, float*c, float4* grad_v, float2* p, float4* q, int width, int height, int stride)
{
    int iy = blockIdx.y * blockDim.y + threadIdx.y;        // current row
    int ix = blockIdx.x * blockDim.x + threadIdx.x;        // current column

    if (iy >= height || ix >= width) return;               // Efficient boundary check
    int pos = ix + iy * stride;
    if (mask[pos] == 0.0f) return;                         // Skip masked elements

    int right = (ix + 1) + iy * stride;
    int down = ix + (iy + 1) * stride;
    int left = (ix - 1) + iy * stride;
    int up = ix + (iy - 1) * stride;
    
    float maskRight = (ix + 1 >= width) ? 0.0f : mask[right];
    float maskDown = (iy + 1 >= height) ? 0.0f : mask[down];

    float u_pos = u_[pos];
    float2 v_pos = v_[pos];

    float u_x = (maskRight != 0.0f) ? (u_[right] - u_pos - v_pos.x) : (u_pos - u_[left] - v_pos.x);
    float u_y = (maskDown != 0.0f) ? (u_[down] - u_pos - v_pos.y) : (u_pos - u_[up] - v_pos.y);

    float du_tensor_x = a[pos] * u_x + c[pos] * u_y;
    float du_tensor_y = c[pos] * u_x + b[pos] * u_y;

    float2 ppos;
    float inv_eta_p = alpha1 * sigma / eta_p;              // Precompute division
    ppos.x = p[pos].x + inv_eta_p * du_tensor_x;
    ppos.y = p[pos].y + inv_eta_p * du_tensor_y;

    float reprojection = fmaxf(1.0f, sqrtf(ppos.x * ppos.x + ppos.y * ppos.y));
    p[pos].x = ppos.x / reprojection;
    p[pos].y = ppos.y / reprojection;

    float4 grad_v_pos;
    grad_v_pos.x = (maskRight != 0.0f) ? (v_[right].x - v_pos.x) : (v_pos.x - v_[left].x);
    grad_v_pos.y = (maskDown != 0.0f) ? (v_[down].y - v_pos.y) : (v_pos.y - v_[up].y);
    grad_v_pos.z = (maskDown != 0.0f) ? (v_[down].x - v_pos.x) : (v_pos.x - v_[up].x);
    grad_v_pos.w = (maskRight != 0.0f) ? (v_[right].y - v_pos.y) : (v_pos.y - v_[left].y);

    grad_v[pos] = grad_v_pos;

    float ase = alpha0 * sigma / eta_q;                    // Precompute division
    float4 qpos;
    qpos.x = q[pos].x + ase * grad_v_pos.x;
    qpos.y = q[pos].y + ase * grad_v_pos.y;
    qpos.z = q[pos].z + ase * grad_v_pos.z;
    qpos.w = q[pos].w + ase * grad_v_pos.w;

    float reproject = fmaxf(1.0f, sqrtf(qpos.x * qpos.x + qpos.y * qpos.y + qpos.z * qpos.z + qpos.w * qpos.w));
    q[pos].x = qpos.x / reproject;
    q[pos].y = qpos.y / reproject;
    q[pos].z = qpos.z / reproject;
    q[pos].w = qpos.w / reproject;
}