#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv(fmap *input,int *ip,int *weights,int R,int S,fmap *output, int Sx, int Sy,int *op,int Px,int Py) {
    // Use block and thread index for optimized calculation
    unsigned int input_id = (blockIdx.x * gridDim.y + blockIdx.y + blockIdx.z * gridDim.x * gridDim.y) * blockDim.x + threadIdx.x;
    int C = input->dim2;
    int H = input->dim3;
    int W = input->dim4;
    int M = output->dim2;
    int E = output->dim3;
    int F = output->dim4;
    
    H += 2 * Py;
    W += 2 * Px;
    
    // Precompute terms for efficient memory access
    int strideC = F * E * M * R * S;
    int strideM = F * E * R * S;
    int strideE = F * R * S;
    int strideF = R * S;
    int strideR = S;
    
    int i = input_id / strideC;
    input_id %= strideC;
    int j = input_id / strideM;
    input_id %= strideM;
    int k = input_id / strideE;
    input_id %= strideE;
    int l = input_id / strideF;
    input_id %= strideF;
    int m = input_id / (R * S);
    input_id %= (R * S);
    int n = input_id / S;
    int o = input_id % S;

    // Perform computation and atomic addition
    int temp = (*(ip + i * C * H * W + m * H * W + (k * Sy + n) * W + (l * Sx + o))) * (*(weights + j * C * R * S + m * R * S + n * S + o));
    atomicAdd((op + i * M * E * F + j * E * F + k * F + l), temp);
}