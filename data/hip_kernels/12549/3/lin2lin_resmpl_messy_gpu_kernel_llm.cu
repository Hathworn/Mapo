#include "hip/hip_runtime.h"
#include "includes.h"

//#define __OUTPUT_PIX__

#define BLOCK_SIZE 32
__constant__ __device__ float lTable_const[1064];
__constant__ __device__ float mr_const[3];
__constant__ __device__ float mg_const[3];
__constant__ __device__ float mb_const[3];

__global__ void lin2lin_resmpl_messy_gpu_kernel(float *dev_in_img, float *dev_out_img, float *dev_C0_tmp, float *dev_C1_tmp, float *dev_C2_tmp, int org_wd, int org_ht, int dst_wd, int dst_ht, int n_channels, float r, int hn, int wn, int xbd0, int xbd1, int ybd0, int ybd1, int *xas_const, int *xbs_const, float *xwts_const, int *yas_const, int *ybs_const, float *ywts_const)
{
    unsigned int x_pos = threadIdx.x + (blockDim.x * blockIdx.x);
    unsigned int y_pos = threadIdx.y + (blockDim.y * blockIdx.y);

    if ((x_pos < dst_wd) && (y_pos < dst_ht)) {
        int xa, ya, yb;
        float wt, wt1;
        float *A00, *A01, *A02, *A03, *B00;
        float *A10, *A11, *A12, *A13, *B10;
        float *A20, *A21, *A22, *A23, *B20;

        /* Use fewer memory offsets by combining accesses */
        float *A0 = dev_in_img + ya * org_wd * n_channels;
        float *B0 = dev_out_img + (0 * dst_ht * dst_wd);
        float *A1 = dev_in_img + (ya * org_wd * n_channels) + 1;
        float *B1 = dev_out_img + (1 * dst_ht * dst_wd);
        float *A2 = dev_in_img + (ya * org_wd * n_channels) + 2;
        float *B2 = dev_out_img + (2 * dst_ht * dst_wd);

        int y1 = 0;
        if (org_ht > dst_ht) {
            int m = 1;
            for (int iter = 0; iter < y_pos; iter++) {
                while (y1 + m < hn && yb == ybs_const[y1 + m])
                    m++;
                y1 += m;
            }
            wt = ywts_const[y1];
            wt1 = 1 - wt;
        } else {
            y1 = y_pos;
            wt = ywts_const[y1];
            wt1 = 1 - wt;
        }

        if (y_pos == 0)
            y1 = 0;

        ya = yas_const[y1];
        A00 = A0;
        A01 = A00 + (org_wd * n_channels);
        A02 = A01 + (org_wd * n_channels);
        A03 = A02 + (org_wd * n_channels);

        A10 = A1;
        A11 = A00 + (org_wd * n_channels);
        A12 = A01 + (org_wd * n_channels);
        A13 = A02 + (org_wd * n_channels);

        A20 = A2;
        A21 = A00 + (org_wd * n_channels);
        A22 = A01 + (org_wd * n_channels);
        A23 = A02 + (org_wd * n_channels);

        yb = ybs_const[y1];
        B00 = B0 + (yb * dst_wd);
        B10 = B1 + (yb * dst_wd);
        B20 = B2 + (yb * dst_wd);

        int x = 0;
        if (org_wd < x_pos) {
            // Resample along y direction
            if (org_ht > dst_ht) {
                int m = 1;
                while ((y1 + m < hn) && (yb == ybs_const[y1 + m]))
                    m++;

                dev_C0_tmp[x_pos] = 0;
                dev_C1_tmp[x_pos] = 0;
                dev_C2_tmp[x_pos] = 0;
                float *A01, *A11, *A21;
                for (int y0 = 0; y0 < m; y0++) {
                    A01 = A00 + (y0 * org_wd);
                    A11 = A10 + (y0 * org_wd);
                    A21 = A20 + (y0 * org_wd);
                    wt1 = ywts_const[y1 + y0];
                    dev_C0_tmp[x_pos] += A01[x_pos] * wt1;
                    dev_C1_tmp[x_pos] += A11[x_pos] * wt1;
                    dev_C2_tmp[x_pos] += A21[x_pos] * wt1;
                }
            } else {
                bool yBd = y_pos < ybd0 || y_pos >= dst_ht - ybd1;

                if (yBd) {
                    dev_C0_tmp[x_pos] = A00[x_pos];
                    dev_C1_tmp[x_pos] = A10[x_pos];
                    dev_C2_tmp[x_pos] = A20[x_pos];
                } else {
                    dev_C0_tmp[x_pos] = (A00[x_pos] * wt) + (A01[x_pos] * wt1);
                    dev_C1_tmp[x_pos] = (A10[x_pos] * wt) + (A11[x_pos] * wt1);
                    dev_C2_tmp[x_pos] = (A20[x_pos] * wt) + (A21[x_pos] * wt1);
                }
            }
        }

        __syncthreads();

        // Resample along x direction (B -> C)
        if (x_pos < dst_wd) {
            if (org_wd > dst_wd) {
                if (xbd0 > 4) {
                    for(x = 0; x < wn; x++) {
                        B00[xbs_const[x]] += dev_C0_tmp[xas_const[x]] * xwts_const[x];
                        B10[xbs_const[x]] += dev_C1_tmp[xas_const[x]] * xwts_const[x];
                        B20[xbs_const[x]] += dev_C2_tmp[xas_const[x]] * xwts_const[x];
                    }
                } else {
                    xa = xas_const[x_pos * 4];
                    for (int i = 0; i < xbd0; ++i) {
                        B00[x_pos] += dev_C0_tmp[xa + i] * xwts_const[(4 * x_pos) + i];
                        B10[x_pos] += dev_C1_tmp[xa + i] * xwts_const[(4 * x_pos) + i];
                        B20[x_pos] += dev_C2_tmp[xa + i] * xwts_const[(4 * x_pos) + i];
                    }
                }
            } else {
                for (x = 0; x < dst_wd; x++) {
                    if (x < xbd0 || x >= dst_wd - xbd1) {
                        B00[x] = dev_C0_tmp[xas_const[x]] * xwts_const[x];
                        B10[x] = dev_C1_tmp[xas_const[x]] * xwts_const[x];
                        B20[x] = dev_C2_tmp[xas_const[x]] * xwts_const[x];
                    } else {
                        B00[x] = dev_C0_tmp[xas_const[x]] * xwts_const[x] + dev_C0_tmp[xas_const[x] + 1] * (r - xwts_const[x]);
                        B10[x] = dev_C1_tmp[xas_const[x]] * xwts_const[x] + dev_C1_tmp[xas_const[x] + 1] * (r - xwts_const[x]);
                        B20[x] = dev_C2_tmp[xas_const[x]] * xwts_const[x] + dev_C2_tmp[xas_const[x] + 1] * (r - xwts_const[x]);
                    }
                }
            }
        }

        __syncthreads();
    }
}