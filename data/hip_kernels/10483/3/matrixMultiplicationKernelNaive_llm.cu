#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void matrixMultiplicationKernelNaive(const float* A, const float* B, float* C, int a, int b, int c, int d) {

    int ROW = blockIdx.y * blockDim.y + threadIdx.y;
    int COL = blockIdx.x * blockDim.x + threadIdx.x;

    float tmpSum = 0.0f;

    if (ROW < a && COL < d) {
        // Use shared memory to optimize for coalesced memory access
        extern __shared__ float shared[];
        float* As = shared;
        float* Bs = (float*)&shared[b * blockDim.y];

        for (int t = 0; t < (b - 1) / blockDim.x + 1; ++t) {
            if (t * blockDim.x + threadIdx.x < b && ROW < a)
                As[threadIdx.y * blockDim.x + threadIdx.x] = A[ROW * b + t * blockDim.x + threadIdx.x];
            else
                As[threadIdx.y * blockDim.x + threadIdx.x] = 0.0f;

            if (t * blockDim.y + threadIdx.y < c && COL < d)
                Bs[threadIdx.y * blockDim.x + threadIdx.x] = B[(t * blockDim.y + threadIdx.y) * d + COL];
            else
                Bs[threadIdx.y * blockDim.x + threadIdx.x] = 0.0f;

            // Synchronize to make sure the sub-matrices are loaded
            __syncthreads();

            for (int ii = 0; ii < blockDim.x; ++ii) {
                tmpSum += As[threadIdx.y * blockDim.x + ii] * Bs[ii * blockDim.x + threadIdx.x];
            }

            // Synchronize to prevent data hazard
            __syncthreads();
        }
        C[ROW * d + COL] = tmpSum;
    }
}