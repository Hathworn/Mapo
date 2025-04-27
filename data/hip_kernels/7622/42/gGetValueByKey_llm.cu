#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gGetValueByKey(float* d_in, float* d_out, int* indeces, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Order blockIdx and blockDim calculations
    if (tid < n) {
        int index = __ldg(&indeces[tid]); // Use __ldg for read-only memory access
        d_out[tid] = __ldg(&d_in[index]); // Use __ldg for read-only memory access
    }
}