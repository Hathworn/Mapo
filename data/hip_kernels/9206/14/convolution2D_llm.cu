#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution2D(const float *d_arr, const float *d_mask, float *d_result, int N) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Perform boundary check only once
    if (i < N && j < N) {
        float avgSum = 0.0f;
        int cnum = 0;

        // Use loop unrolling for a 3x3 kernel
        #pragma unroll
        for (int p = i - 1; p <= i + 1; p++) {
            #pragma unroll
            for (int q = j - 1; q <= j + 1; q++) {
                if (p >= 0 && p < N && q >= 0 && q < N) {
                    avgSum += d_arr[p * N + q] * d_mask[cnum];
                }
                cnum++;
            }
        }

        // Store result directly outside loops
        d_result[i * N + j] = avgSum;
    }
}