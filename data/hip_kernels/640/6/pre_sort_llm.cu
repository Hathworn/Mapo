#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pre_sort(unsigned int *in, unsigned int *in_pos, unsigned int *out, unsigned int *out_pos, unsigned int n, unsigned int nBins, unsigned int mask, unsigned int current_bits, unsigned int *d_hist)
{
    extern __shared__ unsigned int pre_sort_blk_data[];
    unsigned int* blk_value = pre_sort_blk_data;
    unsigned int* blk_pos = pre_sort_blk_data + blockDim.x;
    unsigned int* blk_hist = pre_sort_blk_data + 2 * blockDim.x;
    unsigned int* blk_Scan = pre_sort_blk_data + nBins + 2 * blockDim.x;

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        blk_value[threadIdx.x] = in[i];
        blk_pos[threadIdx.x] = in_pos[i];
    }
    __syncthreads();

    // Initialize histogram
    for (int j = threadIdx.x; j < nBins; j += blockDim.x)
    {
        blk_hist[j] = 0;
        blk_Scan[j] = 0;
    }
    __syncthreads();

    if (i < n)
    {
        unsigned int bin = (blk_value[threadIdx.x] >> current_bits) & mask;
        atomicAdd(&blk_hist[bin], 1);
    }
    __syncthreads();

    // Exclusive scan for histogram
    for (int stride = 1; stride < nBins; stride *= 2)
    {
        unsigned int temp = 0;
        int j = threadIdx.x + stride;
        if (j < nBins) temp = blk_Scan[j - stride];
        __syncthreads();
        if (j < nBins) blk_Scan[j] += temp;
        __syncthreads();
    }

    // Adjust scan results
    if (threadIdx.x < nBins)
        blk_Scan[threadIdx.x] = (threadIdx.x == 0) ? 0 : blk_Scan[threadIdx.x - 1];
    __syncthreads();

    if (i < n)
    {
        unsigned int bin = (blk_value[threadIdx.x] >> current_bits) & mask;
        unsigned int pos = atomicAdd(&blk_Scan[bin], 1);
        out[pos + blockIdx.x * blockDim.x] = blk_value[threadIdx.x];
        out_pos[pos + blockIdx.x * blockDim.x] = blk_pos[threadIdx.x];
    }
}