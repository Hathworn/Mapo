#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gGetValueByKey(float* d_in, float* d_out, int* indeces, int n) {
    int tid = threadIdx.x + blockDim.x * blockIdx.x;
    // Check boundary condition with warp size step
    for (int i = tid; i < n; i += blockDim.x * gridDim.x) {
        int index = indeces[i];
        d_out[i] = d_in[index];
    }
}