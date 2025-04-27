#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc_psf_hat(float* d_psf, float *d_psf_hat, int psf_rows, int psf_cols)
{
    // Use shared memory for faster access
    __shared__ float shared_psf[1024]; // Adjust size according to blockDim and psf size

    int row = threadIdx.y + blockIdx.y * blockDim.y;
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int local_idx = threadIdx.y * blockDim.x + threadIdx.x;

    // Load data into shared memory
    if(row < psf_rows && col < psf_cols)
    {
        shared_psf[local_idx] = d_psf[row * psf_cols + col];
    }
    __syncthreads();

    // Compute the result using shared memory
    if(row < psf_rows && col < psf_cols)
    {
        int index = (psf_rows - row - 1) * psf_cols + psf_cols - col - 1;
        d_psf_hat[index] = shared_psf[local_idx];
    }
}