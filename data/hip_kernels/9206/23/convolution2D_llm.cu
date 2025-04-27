#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution2D(const float *d_arr, const float *d_mask, float *d_result, int N) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Use shared memory for d_mask and parts of d_arr for faster access
    __shared__ float s_mask[9];
    if (threadIdx.x < 9) {
        s_mask[threadIdx.x] = d_mask[threadIdx.x];
    }
    __syncthreads();

    if (i < N && j < N) {
        float avgSum = 0;
        int id, cnum = 0;
        for (int p = i - 1; p <= i + 1; p++) {
            for (int q = j - 1; q <= j + 1; q++) {
                if (p >= 0 && p < N && q >= 0 && q < N) {
                    id = p * N + q;
                    avgSum += d_arr[id] * s_mask[cnum]; // Use shared memory mask
                }
                cnum++;
            }
        }
        d_result[i * N + j] = avgSum;
    }
}