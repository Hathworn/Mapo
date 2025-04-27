#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cal_pi_d(double *sum, int nbin, double step, int nthreads, int nblocks) {

    extern __shared__ double sdata[];  // Shared memory for block-level reduction
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Sequential thread index across the blocks
    int tid = threadIdx.x;  // Local thread index within the block
    double x, mySum = 0.0;

    // Perform calculation and store intermediate results in mySum
    for (int i = idx; i < nbin; i += nthreads * nblocks) {
        x = (i + 0.5) * step;
        mySum += 4.0 / (1.0 + x * x);
    }

    // Store the result in shared memory for block reduction
    sdata[tid] = mySum;
    __syncthreads(); 

    // Perform block-level reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write the block's result to the global sum
    if (tid == 0) {
        sum[blockIdx.x] = sdata[0];
    }
}