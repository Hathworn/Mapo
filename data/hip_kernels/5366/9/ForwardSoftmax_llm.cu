#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ForwardSoftmax(float *Z, int nColsZ, float *sumExp, float *A)
{
    int row = threadIdx.x;
    int col = blockIdx.x;
    extern __shared__ float shared_sumExp[];

    // Initialize shared sumExp
    if (row == 0) shared_sumExp[col] = 0.0f;
    __syncthreads();

    // Reduce sum in shared memory
    atomicAdd(&shared_sumExp[col], exp(Z[row * nColsZ + col]));
    __syncthreads();

    // Write final result to global memory
    if (row == 0) atomicAdd(&sumExp[col], shared_sumExp[col]);
    __syncthreads();
    
    // Calculate softmax and store in A
    A[row * nColsZ + col] = exp(Z[row * nColsZ + col]) / shared_sumExp[col];
}