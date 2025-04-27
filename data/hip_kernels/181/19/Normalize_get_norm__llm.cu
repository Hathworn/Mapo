#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128

#define DISP_MAX 256

__global__ void Normalize_get_norm_(float *input, float *norm, int size1, int size23, int size023)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for reduction to minimize global memory accesses
    extern __shared__ float sharedSum[];

    if (id < size023) {
        int dim23 = id % size23;
        int dim0 = id / size23;

        float sum = 0.0f;
        for (int dim1 = threadIdx.y; dim1 < size1; dim1 += blockDim.y) {
            float x = input[(dim0 * size1 + dim1) * size23 + dim23];
            sum += x * x;
        }

        sharedSum[threadIdx.x] = sum;
        __syncthreads();

        // Intra-block reduction
        for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
            if (threadIdx.x < offset) {
                sharedSum[threadIdx.x] += sharedSum[threadIdx.x + offset];
            }
            __syncthreads();
        }

        // Write the final result to global memory
        if (threadIdx.x == 0) {
            norm[dim0 * size23 + dim23] = sharedSum[0] + 1e-5f;
        }
    }
}