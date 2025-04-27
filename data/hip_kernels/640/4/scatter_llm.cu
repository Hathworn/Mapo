#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scatter(unsigned int *in, unsigned int *in_pos, unsigned int *out, unsigned int *out_pos, unsigned int n, unsigned int *d_histScan, unsigned int mask, unsigned int current_bits, unsigned int nBins) {
    extern __shared__ unsigned int min_Idx[];

    // Initialize min_Idx using a single loop to improve performance.
    for (int j = threadIdx.x; j < nBins; j += blockDim.x)
        min_Idx[j] = n;
    __syncthreads();

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        unsigned int bin = (in[i] >> current_bits) & mask;
        atomicMin(&min_Idx[bin], i);
    }
    __syncthreads();

    // Combine the two if conditions for better warp execution.
    if (i < n) {
        unsigned int bin = (in[i] >> current_bits) & mask;
        unsigned int index = d_histScan[blockIdx.x + bin * gridDim.x] + i - min_Idx[bin];
        
        // Ensure coalesced global memory access for outputs.
        out[index] = in[i];
        out_pos[index] = in_pos[i];
    }
}