#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_A_ch_1_2(float* rho, float* dz, float* s_a, float* xx_or_yy, float* s_b, float K, int npix, int nchannels, int nimages, float* A_ch) {
    // Calculate global indices directly and combine logical checks
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    int c = blockIdx.z * blockDim.z + threadIdx.z;

    if (i < npix && j < nimages && c < nchannels) {
        // Pre-calculate repeated indices for efficiency
        int idx = c*npix*nimages + j*npix + i;
        int rho_idx = c*npix + i;
        int img_idx = c * nimages * 3 + j;

        // Compute the result with fewer arithmetic operations
        A_ch[idx] = (rho[rho_idx] / dz[i]) * (K * s_a[img_idx] - xx_or_yy[i] * s_b[img_idx]);
    }
}