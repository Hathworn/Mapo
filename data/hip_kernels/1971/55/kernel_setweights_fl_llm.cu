#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_setweights_fl(int N, float *wt, float alpha) {
    // Calculate the global thread index
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure only valid threads proceed
    if (tid < N) {
        // Directly set the weight to alpha
        wt[tid] = alpha;
    }
}