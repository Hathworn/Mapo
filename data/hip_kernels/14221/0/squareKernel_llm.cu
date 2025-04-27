#include "hip/hip_runtime.h"
#include "includes.h"
const int listLength = 700;
__global__ void squareKernel(float* d_in, float *d_out, int threads_num) {
    const unsigned int gid = blockIdx.x * blockDim.x + threadIdx.x; // global id
    if (gid < threads_num) {
        float temp = d_in[gid] / (d_in[gid] - 2.3f); // avoid redundant computation
        d_out[gid] = temp * temp * temp; // use multiplication instead of powf for efficiency
    }
}