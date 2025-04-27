#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

__global__ void makeHVector(int rows, float * input, float * output)
{
    int i;
    float elt, sum;
    __shared__ float beta, sums[NTHREADS];

    // Avoids unnecessary thread execution outside the needed range
    if(threadIdx.x >= rows)
        return;
    
    sum = 0.f;
    // Unroll loop partially for better performance
    for(i = threadIdx.x ; i < rows; i += NTHREADS) {
        if((threadIdx.x == 0) && (i == 0))
            continue;
        elt = input[i];
        output[i] = elt;
        sum += elt * elt;
    }
    sums[threadIdx.x] = sum;
    __syncthreads();

    // Optimize reduction with loop unrolling
    for(i = blockDim.x >> 1; i > 0 ; i >>= 1) {
        if(threadIdx.x < i) 
            sums[threadIdx.x] += sums[threadIdx.x + i];
        __syncthreads();
    }

    if(threadIdx.x == 0) {
        elt = input[0];
        float norm = sqrtf(elt * elt + sums[0]);

        // Use a single branch to update elt
        elt += (elt > 0) ? norm : -norm;

        output[0] = elt;

        norm = elt * elt + sums[0];
        beta = sqrtf(2.f / norm);
    }
    __syncthreads();

    // Vectorization opportunity by eliminating loop
    for(i = threadIdx.x; i < rows; i += NTHREADS)
        output[i] *= beta;
}