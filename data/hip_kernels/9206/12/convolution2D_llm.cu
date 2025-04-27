#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution2D(const float *d_arr, const float *d_mask, float *d_result, int N) {
    int i = blockIdx.y * blockDim.y + threadIdx.y; // Optimize: Calculate row index using block and thread.
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Optimize: Calculate column index using block and thread.
    int globalId = i * N + j;

    if (i < N && j < N) {
        float avgSum = 0;
        int cnum = 0;
        for (int p = i - 1; p <= i + 1; p++) {
            for (int q = j - 1; q <= j + 1; q++) {
                // Optimize: Combine boundary checks in a single condition.
                if (p >= 0 && p < N && q >= 0 && q < N) {
                    avgSum += d_arr[p * N + q] * d_mask[cnum];
                }
                cnum++;
            }
        }
        d_result[globalId] = avgSum;
    }
}