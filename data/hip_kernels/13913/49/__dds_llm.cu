#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __dds(int nrows, int nnz, double *A, double *B, int *Cir, int *Cic, double *P) {
    extern __shared__ double parts[];  // Use dynamic shared memory
    int tid = threadIdx.x + blockDim.x * threadIdx.y;
    int jstart = ((long long)blockIdx.x) * nnz / gridDim.x;
    int jend = ((long long)(blockIdx.x + 1)) * nnz / gridDim.x;

    // Unroll j loop for better performance
    for (int j = jstart; j < jend; j += blockDim.x * blockDim.y) {
        double sum = 0;
        int aoff = nrows * Cir[j];
        int boff = nrows * Cic[j];

        // Use local variable for shared memory indexing
        int local_tid = tid + j % blockDim.x;
        
        for (int i = tid; i < nrows; i += blockDim.x * blockDim.y) {
            sum += A[i + aoff] * B[i + boff];
        }
        parts[local_tid] = sum;
        
        // Optimized reduction using loop unrolling
        for (int stride = blockDim.x * blockDim.y / 2; stride > 0; stride >>= 1) {
            __syncthreads();
            if (local_tid < stride) {
                parts[local_tid] += parts[local_tid + stride];
            }
        }
        
        if (local_tid == 0) {
            P[j] = parts[0];
        }
    }
}