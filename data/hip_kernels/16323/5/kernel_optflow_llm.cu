#include "hip/hip_runtime.h"
#include "includes.h"
#define INDEX(row, col, width) ((row) * (width) + (col))

__device__ size_t GIDX(size_t row, size_t col, int H, int W) {
    return INDEX(row, col, W);
}

__global__ void kernel_optflow(float* d_dx1, float* d_dy1, float* d_dx2, float* d_dy2, float* d_dt, float4* uv, float4* uv1, int H, int W) {
    const size_t col = threadIdx.x + blockDim.x * blockIdx.x;
    const size_t row = threadIdx.y + blockDim.y * blockIdx.y;
    const size_t idx = GIDX(row, col, H, W);

    if (row >= H - 2 || row <= 2 || col >= W - 2 || col <= 2) return;
    
    float dx2 = 0.0f, dy2 = 0.0f, dxdy = 0.0f, dxdt = 0.0f, dydt = 0.0f;

    // Precompute index offsets
    int offsets[5] = {-2, -1, 0, 1, 2};

#pragma unroll
    // Loop unrolling and make use of local variables to hold indices
    for (int i = 0; i < 5; i++) {
        int row_offset = row + offsets[i];
        for (int j = 0; j < 5; j++) {
            int col_offset = col + offsets[j];
            int index = INDEX(row_offset, col_offset, W);
            float dx1_val = d_dx1[index];
            float dy1_val = d_dy1[index];
            float dt_val = d_dt[index];

            dx2 += dx1_val * dx1_val;
            dy2 += dy1_val * dy1_val;
            dxdy += dx1_val * dy1_val;
            dxdt += dx1_val * dt_val;
            dydt += dy1_val * dt_val;
        }
    }

    float det = dx2 * dy2 - dxdy * dxdy;
    if (fabsf(det) <= 1.5e-8) {
        uv[idx] = make_float4(0.0f, 0.0f, 0.0f, 0.0f);
        uv1[idx] = uv[idx];
        return;
    }

    float trace = dx2 + dy2;
    float delta = sqrtf(trace * trace - 4.0f * det);
    if (isnan(delta) || trace - delta <= 0.0002) {
        uv[idx] = make_float4(0.0f, 0.0f, 0.0f, 0.0f);
        uv1[idx] = uv[idx];
        return;
    }

    uv[idx].x = (dy2 * -dxdt + dxdy * dydt) / det;
    uv[idx].y = (dxdy * dxdt - dx2 * dydt) / det;
    uv1[idx] = uv[idx];
}