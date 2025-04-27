#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FF_calc (float *q_S_ref_dS, float *WK, float *vdW, int num_q, int num_ele, float c1, float r_m, float *FF_table, float rho) {

    __shared__ float q_pt, q_WK, C1, expC1;
    __shared__ float FF_pt[7]; // num_ele + 1, the last one for water.
    __shared__ float vdW_s[7];
    __shared__ float WK_s[66];
    __shared__ float C1_PI_43_rho;

    if (blockIdx.x >= num_q) return; // out of q range

    // Load WK into shared memory more efficiently
    for (int jj = threadIdx.x; jj < 11 * num_ele; jj += blockDim.x) {
        WK_s[jj] = WK[jj];
    }
    __syncthreads();

    for (int ii = blockIdx.x; ii < num_q; ii += gridDim.x) {
        q_pt = q_S_ref_dS[ii];
        q_WK = q_pt / (4.0 * PI);
        
        // Calculate FoXS C1 term 
        expC1 = -powf((4.0 * PI / 3.0), 1.5) * q_WK * q_WK * r_m * r_m * (c1 * c1 - 1.0) / (4.0 * PI);
        C1 = powf(c1, 3) * exp(expC1);
        C1_PI_43_rho = C1 * PI * 4.0 / 3.0 * rho;

        // Preload vdW data into shared memory
        for (int jj = threadIdx.x; jj < num_ele + 1; jj += blockDim.x) {
            vdW_s[jj] = vdW[jj];
        }
        __syncthreads();

        // Calculate Form factor for this block (or q vector)
        for (int jj = threadIdx.x; jj < num_ele + 1; jj += blockDim.x) {
            if (jj == num_ele) {
                // Water calculation
                FF_pt[jj] = WK_s[3 * 11 + 5];
                FF_pt[jj] += 2.0 * WK_s[5];
                float vdW_jj = vdW_s[jj];
                float exp_factor = exp(-PI * vdW_jj * vdW_jj * q_WK * q_WK);
                FF_pt[jj] -= C1_PI_43_rho * powf(vdW_jj, 3.0) * exp_factor;

#pragma unroll 5
                for (int kk = 0; kk < 5; kk++) {
                    float exp_term = exp(-WK_s[3 * 11 + kk + 6] * q_WK * q_WK);
                    FF_pt[jj] += WK_s[3 * 11 + kk] * exp_term;
                    FF_pt[jj] += WK_s[kk] * exp_term;
                    FF_pt[jj] += WK_s[kk] * exp_term;
                }
            } 
            else {
                // Element calculation
                FF_pt[jj] = WK_s[jj * 11 + 5];
                float vdW_jj = vdW_s[jj];
                float exp_factor = exp(-PI * vdW_jj * vdW_jj * q_WK * q_WK);
                FF_pt[jj] -= C1_PI_43_rho * powf(vdW_jj, 3.0) * exp_factor;

#pragma unroll 5
                for (int kk = 0; kk < 5; kk++) {
                    float exp_term = exp(-WK_s[jj * 11 + kk + 6] * q_WK * q_WK);
                    FF_pt[jj] += WK_s[jj * 11 + kk] * exp_term;
                }
            }
            FF_table[ii * (num_ele + 1) + jj] = FF_pt[jj];
        }
    }
}