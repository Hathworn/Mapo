#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cal_pi_d(double *sum, int nbin, double step, int nthreads, int nBLOCKS) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    double x;
    double sum_local = 0.0; // Use a local variable to reduce global memory access

    for (int i=idx; i < nbin; i += nthreads * nBLOCKS) {
        x = (i + 0.5) * step;
        sum_local += 4.0 / (1.0 + x * x);
    }

    sum[idx] = sum_local; // Store the result back to global memory once
}