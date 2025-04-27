#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lineark(int *ip, int *weight, int *op, int N, int M, int L) {
    unsigned int input_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid computation when input_id is out of bounds
    if (input_id >= N * M * L) return;

    int i = input_id / (M * L);
    int j = (input_id / L) % M;
    int k = input_id % L;

    int temp = ip[i * L + k] * weight[j * L + k];

    // More friendly atomicAdd usage for better performance
    atomicAdd(&op[i * M + j], temp);
}