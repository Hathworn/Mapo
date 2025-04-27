#include "hip/hip_runtime.h"
#include "includes.h"

//#define __OUTPUT_PIX__

#define BLOCK_SIZE 32
__constant__ __device__ float lTable_const[1064];
__constant__ __device__ float mr_const[3];
__constant__ __device__ float mg_const[3];
__constant__ __device__ float mb_const[3];

__global__ void lin2lin_resmpl_good_gpu_kernel(float *dev_in_img, float *dev_out_img, float *dev_C0_tmp, float *dev_C1_tmp, float *dev_C2_tmp, int org_wd, int org_ht, int dst_wd, int dst_ht, int n_channels, float r, int *yas_const, int *ybs_const)
{
    unsigned int x_pos = threadIdx.x + (blockDim.x * blockIdx.x);
    unsigned int y_pos = threadIdx.y + (blockDim.y * blockIdx.y);

    if ((x_pos < dst_wd) && (y_pos < dst_ht)) {
        int ya, yb;
        float *A0 = dev_in_img + (0 * org_ht * org_wd);
        float *B0 = dev_out_img + (0 * dst_ht * dst_wd);
        float *A1 = dev_in_img + (1 * org_ht * org_wd);
        float *B1 = dev_out_img + (1 * dst_ht * dst_wd);
        float *A2 = dev_in_img + (2 * org_ht * org_wd);
        float *B2 = dev_out_img + (2 * dst_ht * dst_wd);

        // Direct copy if no need for resampling
        if (org_ht == dst_ht && org_wd == dst_wd) {
            int out_img_idx = y_pos * dst_wd + x_pos;
            B0[out_img_idx] = A0[out_img_idx * n_channels];
            B1[out_img_idx] = A1[out_img_idx * n_channels];
            B2[out_img_idx] = A2[out_img_idx * n_channels];
            return;
        }

        // Calculate scaled y position
        int y1 = y_pos * (org_ht / dst_ht);

        ya = yas_const[y1];
        float *A00 = A0 + (ya * org_wd);
        float *A10 = A1 + (ya * org_wd);
        float *A20 = A2 + (ya * org_wd);

        yb = ybs_const[y1];
        float *B00 = B0 + (yb * dst_wd);
        float *B10 = B1 + (yb * dst_wd);
        float *B20 = B2 + (yb * dst_wd);

        // Resample along y direction
        int y_ratio = org_ht / dst_ht;
        float c0 = 0, c1 = 0, c2 = 0;
        for (int i = 0; i < y_ratio; ++i) {
            c0 += A00[x_pos + i * org_wd];
            c1 += A10[x_pos + i * org_wd];
            c2 += A20[x_pos + i * org_wd];
        }
        dev_C0_tmp[x_pos] = c0;
        dev_C1_tmp[x_pos] = c1;
        dev_C2_tmp[x_pos] = c2;

        __syncthreads();

        // Resample along x direction (B -> C)
        int x_ratio = org_wd / dst_wd;
        float sum0 = 0, sum1 = 0, sum2 = 0;
        for (int i = 0; i < x_ratio; ++i) {
            sum0 += dev_C0_tmp[x_ratio * x_pos + i];
            sum1 += dev_C1_tmp[x_ratio * x_pos + i];
            sum2 += dev_C2_tmp[x_ratio * x_pos + i];
        }
        B00[x_pos] = sum0 * (r / x_ratio);
        B10[x_pos] = sum1 * (r / x_ratio);
        B20[x_pos] = sum2 * (r / x_ratio);
        
        __syncthreads();
    }
}