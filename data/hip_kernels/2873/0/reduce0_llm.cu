#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

int test_reduce(int* v);

using namespace std;

__global__ void reduce0(int *g_idata, int *g_odata) {
    extern __shared__ int sdata[];
    // Load elements from global to shared mem
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < blockDim.x * gridDim.x) { // Check bounds to prevent out-of-bounds memory access
        sdata[tid] = g_idata[i];
    } else {
        sdata[tid] = 0;
    }
    __syncthreads();

    // Reduction in shared memory
    for(unsigned int s = blockDim.x / 2; s > 0; s >>= 1) { // Start from half block size and use bit shift
        if (tid < s) {// Ensure threads operate within bounds
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}