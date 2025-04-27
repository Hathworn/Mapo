#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

__global__ void makeHVector(int rows, float * input, float * output)
{
    int idx = threadIdx.x;
    if (idx >= rows) return;
    
    float sum = 0.f;
    __shared__ float beta;
    __shared__ float sums[NTHREADS];
    
    // Use loop unrolling for better performance
    for (int i = idx; i < rows; i += NTHREADS) {
        if ((idx == 0) && (i == 0)) continue;
        float elt = input[i];
        output[i] = elt;
        sum += elt * elt;
    }
    sums[idx] = sum;
    __syncthreads();

    // Use a more efficient reduction strategy
    for (int i = blockDim.x >> 1; i > 0; i >>= 1) {
        if (idx < i) sums[idx] += sums[idx + i];
        __syncthreads();
    }

    if (idx == 0) {
        float elt = input[0];
        float norm = sqrtf(elt * elt + sums[0]);
        
        elt = (elt > 0) ? elt + norm : elt - norm;
        
        output[0] = elt;
        
        norm = elt * elt + sums[0];
        beta = sqrtf(2.f / norm);
    }
    __syncthreads();

    // Multiply output by beta
    for (int i = idx; i < rows; i += NTHREADS) {
        output[i] *= beta;
    }
}