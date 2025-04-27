#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

#define BLOCKSIZE 32

//test code
__global__ void nmfh(float *a, int r, int c, int k, float *w, float *h, float *hcp) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Compute H
    if (row < k && col < c) {
        float temp = 0.0f;
        float sum1 = 0.0f;
        float sum2 = 0.0f;

        // Optimize inner summation loop for W'A
        #pragma unroll
        for (int i = 0; i < r; i++) {
            sum1 += w[i * k + row] * a[i * c + col];
        }
        temp = h[row * c + col] * sum1;

        // Optimize summation loop for W'WH
        for (int i = 0; i < k; i++) {
            #pragma unroll
            for (int j = 0; j < r; j++) {
                sum2 += w[j * k + row] * w[j * k + i] * h[i * c + col];
            }
        }

        // Remove unnecessary __syncthreads()
        hcp[row * c + col] = temp / sum2;
    }
}