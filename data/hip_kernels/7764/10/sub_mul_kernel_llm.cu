#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sub_mul_kernel(double *g_out, double *a, double *b1, double *b2, double *ct, int n) {
    const int j2 = blockIdx.x * blockDim.x + threadIdx.x;
    const int m = n >> 1;
    const int nc = n >> 2;
    const int j = j2 << 1;
    
    // Use shared memory for ct to reduce global memory accesses
    __shared__ double shared_ct[1024]; // Assumes block size <= 1024
    if (threadIdx.x < nc) {
        shared_ct[threadIdx.x] = ct[threadIdx.x];
    }
    __syncthreads();

    if (j2) {
        int nminusj = n - j;
        double wkr = 0.5 - shared_ct[nc - j2];
        double wki = shared_ct[j2];
        double ajr = a[j];
        double aji = a[1 + j];
        double akr = a[nminusj];
        double aki = a[1 + nminusj];
        double xr = ajr - akr;
        double xi = aji + aki;
        double yr = wkr * xr - wki * xi;
        double yi = wkr * xi + wki * xr;
        ajr -= yr;
        aji -= yi;
        akr += yr;
        aki -= yi;

        // Pre-compute differences to reduce redundant calculations
        double bjr = b1[j] - b2[j];
        double bji = b1[1 + j] - b2[1 + j];
        double bkr = b1[nminusj] - b2[nminusj];
        double bki = b1[1 + nminusj] - b2[1 + nminusj];

        double new_aji = ajr * bji + bjr * aji;
        double new_ajr = ajr * bjr - aji * bji;
        double new_aki = akr * bki + bkr * aki;
        double new_akr = akr * bkr - aki * bki;

        xr = new_ajr - new_akr;
        xi = new_aji + new_aki;
        yr = wkr * xr + wki * xi;
        yi = wkr * xi - wki * xr;
        g_out[j] = new_ajr - yr;
        g_out[1 + j] = yi - new_aji;
        g_out[nminusj] = new_akr + yr;
        g_out[1 + nminusj] = yi - new_aki;
    } else {
        // Inline computation and simplify access for j2 == 0
        double xr = a[0];
        double xi = a[1];
        double yr = b1[0] - b2[0];
        double yi = b1[1] - b2[1];
        g_out[0] = xr * yr + xi * yi;
        g_out[1] = -xr * yi - xi * yr;
        xr = a[m];
        xi = a[1 + m];
        yr = b1[m] - b2[m];
        yi = b1[1 + m] - b2[1 + m];
        g_out[m] = xr * yr - xi * yi;
        g_out[1 + m] = -xr * yi - xi * yr;
    }
}