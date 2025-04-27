#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gGetValueByKey(float* d_in, float* d_out, int* indeces, int n) {
    int tid = threadIdx.x + blockDim.x * blockIdx.x;
    if(tid < n) {
        // Load index value only once into a register
        int index = __ldg(&indeces[tid]); 
        d_out[tid] = __ldg(&d_in[index]); // Use read-only cache for global memory access
    }
}