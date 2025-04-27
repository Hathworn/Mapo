#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution2D(const float *d_arr, const float *d_mask, float *d_result, int N) {
    int i = blockIdx.x*blockDim.x + threadIdx.x;
    int j = blockIdx.y*blockDim.y + threadIdx.y;

    // Use shared memory to optimize memory access
    __shared__ float shared_arr[blockDim.x][blockDim.y];

    int globalId = i*N + j;
    if(i < N && j < N) {
        float avgSum = 0;
        int id, cnum = 0;

        // Load data into shared memory
        if (i < N && j < N) {
            shared_arr[threadIdx.x][threadIdx.y] = d_arr[globalId];
        }
        __syncthreads();

        for(int p = -1; p <= 1; p++) {
            for(int q = -1; q <= 1; q++) {
                int new_i = i + p;
                int new_j = j + q;
                if(new_i >= 0 && new_i < N && new_j >= 0 && new_j < N) {
                    // Access shared memory instead of global memory
                    avgSum += shared_arr[threadIdx.x + p][threadIdx.y + q] * d_mask[cnum];
                }
                cnum++;
            }
        }
        
        // Write result to global memory
        d_result[globalId] = avgSum;
    }
}