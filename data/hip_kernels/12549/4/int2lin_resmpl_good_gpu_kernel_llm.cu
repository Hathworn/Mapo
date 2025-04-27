#include "hip/hip_runtime.h"
#include "includes.h"

//#define __OUTPUT_PIX__

#define BLOCK_SIZE 32
__constant__ __device__ float lTable_const[1064];
__constant__ __device__ float mr_const[3];
__constant__ __device__ float mg_const[3];
__constant__ __device__ float mb_const[3];

__global__ void int2lin_resmpl_good_gpu_kernel(float *dev_in_img, float *dev_out_img, float *dev_C0_tmp, float *dev_C1_tmp, float *dev_C2_tmp, int org_wd, int org_ht, int dst_wd, int dst_ht, int n_channels, float r, int *yas_const, int *ybs_const)
{
    unsigned int x_pos = threadIdx.x + (blockDim.x * blockIdx.x);
    unsigned int y_pos = threadIdx.y + (blockDim.y * blockIdx.y);

    if ((x_pos < dst_wd) && (y_pos < dst_ht)) {
        int ya, yb;
        float *A00, *A01, *A02, *A03;
        float *A10, *A11, *A12, *A13;
        float *A20, *A21, *A22, *A23;
        float *B00, *B10, *B20;

        float *A0 = dev_in_img + 0;
        float *B0 = dev_out_img + (0 * dst_ht * dst_wd);
        float *A1 = dev_in_img + 1;
        float *B1 = dev_out_img + (1 * dst_ht * dst_wd);
        float *A2 = dev_in_img + 2;
        float *B2 = dev_out_img + (2 * dst_ht * dst_wd);

        if (org_ht == dst_ht && org_wd == dst_wd) {
            int out_img_idx = y_pos + (dst_wd * x_pos);
            B0[out_img_idx] = A0[out_img_idx * n_channels];
            B1[out_img_idx] = A1[out_img_idx * n_channels];
            B2[out_img_idx] = A2[out_img_idx * n_channels];
            return;
        }

        int y1 = 0;
        y1 += (org_ht / dst_ht) * y_pos;

        if (y_pos == 0) y1 = 0;

        ya = yas_const[y1];
        A00 = A0 + (ya * org_wd * n_channels);
        A01 = A00 + (org_wd * n_channels);
        A02 = A01 + (org_wd * n_channels);
        A03 = A02 + (org_wd * n_channels);

        A10 = A1 + (ya * org_wd * n_channels);
        A11 = A10 + (org_wd * n_channels);
        A12 = A11 + (org_wd * n_channels);
        A13 = A12 + (org_wd * n_channels);

        A20 = A2 + (ya * org_wd * n_channels);
        A21 = A20 + (org_wd * n_channels);
        A22 = A21 + (org_wd * n_channels);
        A23 = A22 + (org_wd * n_channels);

        yb = ybs_const[y1];
        B00 = B0 + (yb * dst_wd);
        B10 = B1 + (yb * dst_wd);
        B20 = B2 + (yb * dst_wd);

        // Resample along y direction
        int ht_ratio = org_ht / dst_ht;
        dev_C0_tmp[x_pos] = 0;
        dev_C1_tmp[x_pos] = 0;
        dev_C2_tmp[x_pos] = 0;
        for (int i = 0; i < ht_ratio; i++) {
            dev_C0_tmp[x_pos] += (A00 + i * (org_wd * n_channels))[x_pos * n_channels];
            dev_C1_tmp[x_pos] += (A10 + i * (org_wd * n_channels))[x_pos * n_channels];
            dev_C2_tmp[x_pos] += (A20 + i * (org_wd * n_channels))[x_pos * n_channels];
        }

        __syncthreads();

        // Resample along x direction (B -> C)
        int wd_ratio = org_wd / dst_wd;
        B00[x_pos] = 0;
        B10[x_pos] = 0;
        B20[x_pos] = 0;
        for (int i = 0; i < wd_ratio; i++) {
            B00[x_pos] += dev_C0_tmp[wd_ratio * x_pos + i];
            B10[x_pos] += dev_C1_tmp[wd_ratio * x_pos + i];
            B20[x_pos] += dev_C2_tmp[wd_ratio * x_pos + i];
        }

        float scale = r / (ht_ratio * wd_ratio);
        B00[x_pos] *= scale;
        B10[x_pos] *= scale;
        B20[x_pos] *= scale;

        __syncthreads();
    }
}