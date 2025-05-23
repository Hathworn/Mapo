#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_bias(float *X, float *b, int N, int ch_in, int h_in, int w_in) {
    int n = blockIdx.x;
    int ch = blockIdx.y;
    int h = threadIdx.x;
    int w = threadIdx.y;
    
    // Calculate the index once for efficiency
    int index = n * ch_in * h_in * w_in + ch * h_in * w_in + h * w_in + w;
    X[index] += b[ch];
}