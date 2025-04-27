#include "hip/hip_runtime.h"
#include "includes.h"
#include <bits/stdc++.h>
#include <hip/hip_runtime.h>

#define SIZE 60 // Global Size
#define BLOCK_SIZE 1024
using namespace std;

// :::: Kernel
__global__ void kernel_prefix_sum_efficient(double *g_idata, double *g_odata, int l) {
    // Shared memory allocation for block-wide data
    __shared__ double temp[BLOCK_SIZE];

    int tid = threadIdx.x;
    int index = blockIdx.x * blockDim.x + tid;

    // Load input into shared memory
    if (index < l) {
        temp[tid] = g_idata[index];
    } else {
        temp[tid] = 0; // Avoid out-of-bounds access
    }
    __syncthreads();

    // Sequential addressing for prefix sum
    for (int offset = 1; offset < blockDim.x; offset *= 2) {
        if (tid >= offset) {
            temp[tid] += temp[tid - offset];
        }
        __syncthreads(); // Ensure all additions are done before the next step
    }

    // Write result to g_odata
    if (index < l) {
        g_odata[index] = temp[tid];
    }
}