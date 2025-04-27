#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __dds(int nrows, int nnz, float *A, float *B, int *Cir, int *Cic, float *P) {
    // Use a dynamic shared memory size
    extern __shared__ float parts[];

    // Calculate the range of work for each block
    int jstart = ((long long)blockIdx.x) * nnz / gridDim.x;
    int jend = ((long long)(blockIdx.x + 1)) * nnz / gridDim.x;

    // Global thread ID
    int tid = threadIdx.x + blockDim.x * threadIdx.y;

    // Use coalesced memory access pattern
    for (int j = jstart; j < jend ; j++) {
        float sum = 0;
        int aoff = nrows * Cir[j];
        int boff = nrows * Cic[j];

        // Optimize memory access by ensuring aligned reads
        for (int i = tid; i < nrows; i += blockDim.x * blockDim.y) {
            sum += A[i + aoff] * B[i + boff];
        }

        // Store the partial sum in shared memory
        parts[tid] = sum;

        // Perform reduction using shared memory
        for (int offset = blockDim.x * blockDim.y / 2; offset > 0; offset /= 2) {
            __syncthreads();
            if (tid < offset) {
                parts[tid] += parts[tid + offset];
            }
        }

        __syncthreads();

        // Write the result of the reduction to global memory
        if (tid == 0) {
            P[j] = parts[0];
        }
        __syncthreads();
    }
}