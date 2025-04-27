#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mult3_kernel(double *g_out, double *a, double *b, double *ct, int n) {
    const int j2 = blockIdx.x * blockDim.x + threadIdx.x;
    // Use registers for frequently reused shared or calculated data
    __shared__ double shared_ct[blockDim.x];
    if (threadIdx.x < (n >> 2)) {
        shared_ct[threadIdx.x] = ct[threadIdx.x];
    }
    __syncthreads();
    
    double wkr, wki, xr, xi, yr, yi, ajr, aji, akr, aki, bjr, bji, bkr, bki;
    double new_ajr, new_aji, new_akr, new_aki;
    const int m = n >> 1;
    const int nc = n >> 2;
    const int j = j2 << 1;

    if (j2 < nc) { // Avoid accessing out-of-bounds memory
        int nminusj = n - j;

        wkr = 0.5 - shared_ct[nc - j2]; // Use shared memory for ct
        wki = shared_ct[j2]; // Use shared memory for ct

        ajr = a[j];
        aji = a[1 + j];
        akr = a[nminusj];
        aki = a[1 + nminusj];
        // Precompute repetitive operations
        xr = ajr - akr;
        xi = aji + aki;
        yr = wkr * xr - wki * xi;
        yi = wkr * xi + wki * xr;
        ajr -= yr;
        aji -= yi;
        akr += yr;
        aki -= yi;

        bjr = b[j];
        bji = b[1 + j];
        bkr = b[nminusj];
        bki = b[1 + nminusj];
        // Reuse computed wkr and wki
        xr = bjr - bkr;
        xi = bji + bki;
        yr = wkr * xr - wki * xi;
        yi = wkr * xi + wki * xr;
        bjr -= yr;
        bji -= yi;
        bkr += yr;
        bki -= yi;

        // Optimize complex multiply into fewer operations
        new_aji = ajr * bji + bjr * aji;
        new_ajr = ajr * bjr - aji * bji;
        new_aki = akr * bki + bkr * aki;
        new_akr = akr * bkr - aki * bki;

        // Reuse previous results as much as possible
        xr = new_ajr - new_akr;
        xi = new_aji + new_aki;
        yr = wkr * xr + wki * xi;
        yi = wkr * xi - wki * xr;
        g_out[j] = new_ajr - yr;
        g_out[1 + j] = yi - new_aji;
        g_out[nminusj] = new_akr + yr;
        g_out[1 + nminusj] = yi - new_aki;
    } else if (j2 == 0) {
        // Handle special case when j2 is zero separately
        xr = a[0];
        xi = a[1];
        yr = b[0];
        yi = b[1];
        g_out[0] = xr * yr + xi * yi;
        g_out[1] = -xr * yi - xi * yr;
        xr = a[0 + m];
        xi = a[1 + m];
        yr = b[0 + m];
        yi = b[1 + m];
        g_out[1 + m] = -xr * yi - xi * yr;
        g_out[0 + m] = xr * yr - xi * yi;
    }
}