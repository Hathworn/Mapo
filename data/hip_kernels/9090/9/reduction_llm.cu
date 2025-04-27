#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction(const int N, float *a, float *result) {
    int thread = threadIdx.x;
    int block  = blockIdx.x;
    int blockSize = blockDim.x;
    int gridSize = gridDim.x;

    //unique global thread ID
    int id = thread + block*blockSize;

    __shared__ float s_sum[256];

    // Use loop unrolling for better performance
    float sum = 0;
    for (int i=0; i<4; i++) {
        int index = id + i * blockSize * gridSize;
        if(index < N){
            sum += a[index];
        }
    }
    s_sum[thread] = sum;

    __syncthreads(); // Ensure all sums are stored in shared memory

    #pragma unroll // Optimization: Unroll the reduction loop
    for (int offset = blockSize / 2; offset > 0; offset /= 2) {
        if (thread < offset) {
            s_sum[thread] += s_sum[thread + offset];
        }
        __syncthreads(); // Ensure all threads complete the reduction step
    }

    // Write block result to the output array
    if (thread == 0) {
        result[block] = s_sum[0];
    }
}