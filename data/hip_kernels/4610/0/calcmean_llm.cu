#include "hip/hip_runtime.h"
#include "includes.h"

#define FLOAT_N 3214212.01

__global__ void calcmean(double* d_data, double* d_mean, int M, int N)
{
    int j = blockIdx.x * blockDim.x + threadIdx.x + 1;
    // Only threads with valid 'j' proceed
    if (j <= M) {
        double temp_sum = 0.0;
        // Loop unrolling can be applied here for potential further optimization
        for (int i = 1; i <= N; i++) {
            temp_sum += d_data[i * (M + 1) + j];
        }
        d_mean[j] = temp_sum / FLOAT_N;
    }
}