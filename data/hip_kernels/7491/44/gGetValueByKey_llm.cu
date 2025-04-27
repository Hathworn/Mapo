#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gGetValueByKey(float* d_in, float* d_out, int* indeces, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index

    if (tid < n) {
        int index = indeces[tid]; // Get index for this thread
        d_out[tid] = d_in[index]; // Write the corresponding d_in value to d_out
    }
}