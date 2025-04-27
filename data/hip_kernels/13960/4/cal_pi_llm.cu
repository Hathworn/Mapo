#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cal_pi(double *sum, int nbin, double step, int nthreads, int nblocks) {
    double local_sum = 0.0;  // Use local variable to accumulate thread's contribution
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Sequential thread index across the blocks
    for (int i = idx; i < nbin; i += nthreads * nblocks) {
        double x = (i + 0.5) * step;
        local_sum += 4.0 / (1.0 + x * x);
    }
    sum[idx] = local_sum;  // Write the result to global memory at once
}