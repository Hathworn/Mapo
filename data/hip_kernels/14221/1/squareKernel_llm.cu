#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void squareKernel(float* d_in, float* d_out, int threads_num) {
    const unsigned int gid = blockIdx.x * blockDim.x + threadIdx.x; // global id
    if (gid < threads_num) {
        float val = d_in[gid];
        float result = val / (val - 2.3f);
        d_out[gid] = result * result * result; // Use repeated multiplication instead of powf
    }
}