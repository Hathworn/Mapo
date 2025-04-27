#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void update_inverse_cuda(float *Ainv, float *u, int N, int rowstride, int k)
{
    extern __shared__ float shared_mem[];
    float *A_k = shared_mem;
    float *u_shared = &shared_mem[N];
    float *Ainv_u = &shared_mem[2 * N];
    float *Ainv_shared = &shared_mem[3 * N];

    int tid = threadIdx.x;

    // Load data into shared memory
    A_k[tid] = Ainv[k * rowstride + tid];
    u_shared[tid] = u[tid];
    
    // Compute k'th element of Ainv_u using reduction
    float sum = u_shared[tid] * A_k[tid];
    for (int n = blockDim.x >> 1; n > 0; n >>= 1) {
        sum += (tid < n) ? __shfl_down_sync(0xFFFFFFFF, sum, n) : 0.0f;
    }
    if (tid == 0) {
        *Ainv_u = sum;
    }
    __syncthreads();

    float prefact = -1.0f / (1.0f + *Ainv_u);

    // Update each row of Ainv
    for (int row = 0; row < N; row++) {
        Ainv_shared[tid] = Ainv[row * rowstride + tid];
        __syncthreads();

        sum = u_shared[tid] * Ainv_shared[tid];
        for (int n = blockDim.x >> 1; n > 0; n >>= 1) {
            sum += (tid < n) ? __shfl_down_sync(0xFFFFFFFF, sum, n) : 0.0f;
        }
        if (tid == 0) {
            *Ainv_u = sum;
        }
        __syncthreads();

        // Update the value of Ainv for the current row
        Ainv[row * rowstride + tid] = Ainv_shared[tid] + prefact * *Ainv_u * A_k[tid];
        __syncthreads();
    }
}