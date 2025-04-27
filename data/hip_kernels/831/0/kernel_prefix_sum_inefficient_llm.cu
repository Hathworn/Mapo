#include "hip/hip_runtime.h"
#include "includes.h"
#include <bits/stdc++.h>
#include <hip/hip_runtime.h>

#define SIZE 60 // Global Size
#define BLOCK_SIZE 1024
using namespace std;

// Kernel
__global__ void kernel_prefix_sum_inefficient(double *g_idata, double *g_odata, int l) {
    __shared__ double sdata[BLOCK_SIZE];
    
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory; avoid branch by always using i-1 and setting 0 outside bounds
    sdata[tid] = (i < l && tid != 0) ? g_idata[i - 1] : 0.0; 
    __syncthreads(); // Ensure all data is loaded into shared memory

    // Perform in-place prefix sum using shared memory
    for (unsigned int s = 1; s < blockDim.x; s *= 2) {
        double val = (tid >= s) ? sdata[tid - s] : 0.0;
        __syncthreads(); // Prevent race conditions
        sdata[tid] += val;
        __syncthreads(); // Ensure correctness for next step
    }

    // Write the result to the output global memory
    if (i < l) {
        g_odata[i] = sdata[tid];
    }
}