#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multVector(int *d1_in, int *d2_in, int *d_out, int n, int m) {
    int ind = blockDim.x * blockIdx.x + threadIdx.x;
    if (ind < m) {
        int temp = 0;  // Use a temporary variable for accumulation
        for (int i = 0; i < n; i++) {
            temp += d1_in[i] * d2_in[i * m + ind];
        }
        d_out[ind] = temp;  // Write the result once
    }
}