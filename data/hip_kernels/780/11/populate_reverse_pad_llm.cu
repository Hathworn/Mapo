#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void populate_reverse_pad(const double *Q, double *Q_reverse_pad, const double *mean, const int window_size, const int size)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    double mu = *mean;

    // Use ternary operator for concise condition check
    Q_reverse_pad[tid] = (tid < window_size) ? (Q[window_size - 1 - tid] - mu) : ((tid < size) ? 0 : Q_reverse_pad[tid]);
}