#include "hip/hip_runtime.h"
#include "includes.h"

/*
* Description:
*/

__device__ int translate_idx_inv(int ii, int d1, int d2, int d3, int d4, int scale_factor_t, int scale_factor_y, int scale_factor_x, int off_time, int off_x, int off_y)
{
    int x, y, t, z, w;
    w = ii % d4;
    ii = ii / d4;
    z = ii % d3;
    ii = ii / d3;
    t = ii % d2;
    ii = ii / d2;
    y = ii % d1;
    ii = ii / d1;
    x = ii;
    t = t * scale_factor_t + off_time;
    w = w * scale_factor_x + off_x;
    z = z * scale_factor_y + off_y;
    d2 *= scale_factor_t;
    d3 *= scale_factor_y;
    d4 *= scale_factor_x;
    return (((((x * d1 + y) * d2) + t) * d3) + z) * d4 + w;
}

__device__ int translate_idx(int ii, int d1, int d2, int d3, int d4, int scale_factor_t, int scale_factor_y, int scale_factor_x)
{
    int x, y, t, z, w;
    w = ii % d4;
    ii = ii / d4;
    z = ii % d3;
    ii = ii / d3;
    t = ii % d2;
    ii = ii / d2;
    y = ii % d1;
    ii = ii / d1;
    x = ii;
    w = w / scale_factor_x;
    z = z / scale_factor_y;
    t = t / scale_factor_t;
    d2 /= scale_factor_t;
    d3 /= scale_factor_y;
    d4 /= scale_factor_x;
    return (((((x * d1 + y) * d2) + t) * d3) + z) * d4 + w;
}

__global__ void downscale(float *gradInput_data, float *gradOutput_data, long no_elements, int scale_factor_t, int scale_factor_y, int scale_factor_x, int d1, int d2, int d3, int d4)
{
    long ii = threadIdx.x + blockDim.x * blockIdx.x + threadIdx.y + blockDim.y * (blockDim.x * gridDim.x) * blockIdx.y;
    if (ii >= no_elements) return;

    // Unrolling the loops to maximize performance
    int scale_factor_t_2 = scale_factor_t / 2;
    int scale_factor_y_2 = scale_factor_y / 2;
    int scale_factor_x_2 = scale_factor_x / 2;

    for (int i = 0; i < scale_factor_t_2; i++){
#pragma unroll
        for(int j = 0; j < scale_factor_y_2; j++){
#pragma unroll
            for(int k = 0; k < scale_factor_x_2; k++){
                int ipidx1 = translate_idx_inv(ii, d1, d2, d3, d4, scale_factor_t, scale_factor_y, scale_factor_x, 2*i, 2*j, 2*k);
                int ipidx2 = translate_idx_inv(ii, d1, d2, d3, d4, scale_factor_t, scale_factor_y, scale_factor_x, 2*i+1, 2*j, 2*k);
                int ipidx3 = translate_idx_inv(ii, d1, d2, d3, d4, scale_factor_t, scale_factor_y, scale_factor_x, 2*i, 2*j+1, 2*k);
                int ipidx4 = translate_idx_inv(ii, d1, d2, d3, d4, scale_factor_t, scale_factor_y, scale_factor_x, 2*i+1, 2*j+1, 2*k);
                int ipidx5 = translate_idx_inv(ii, d1, d2, d3, d4, scale_factor_t, scale_factor_y, scale_factor_x, 2*i, 2*j, 2*k+1);
                int ipidx6 = translate_idx_inv(ii, d1, d2, d3, d4, scale_factor_t, scale_factor_y, scale_factor_x, 2*i+1, 2*j, 2*k+1);
                int ipidx7 = translate_idx_inv(ii, d1, d2, d3, d4, scale_factor_t, scale_factor_y, scale_factor_x, 2*i, 2*j+1, 2*k+1);
                int ipidx8 = translate_idx_inv(ii, d1, d2, d3, d4, scale_factor_t, scale_factor_y, scale_factor_x, 2*i+1, 2*j+1, 2*k+1);

                gradInput_data[ii] += gradOutput_data[ipidx1] + gradOutput_data[ipidx2] + gradOutput_data[ipidx3] + gradOutput_data[ipidx4] +
                                      gradOutput_data[ipidx5] + gradOutput_data[ipidx6] + gradOutput_data[ipidx7] + gradOutput_data[ipidx8];
            }
        }
    }
}