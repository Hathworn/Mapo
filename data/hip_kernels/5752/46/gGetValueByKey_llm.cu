#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gGetValueByKey(float* d_in, float* d_out, int* indeces, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Compute thread ID
    if(tid < n) {
        int index = __ldg(&indeces[tid]);  // Use __ldg for better memory load performance
        d_out[tid] = d_in[index]; // Retrieve value by index
    }
}