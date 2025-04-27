#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void update_inverse_cuda(float *Ainv, float *u, int N, int rowstride, int k) {
    __shared__ float A_k[NMAX], u_shared[NMAX], Ainv_u[NMAX], Ainv_shared[NMAX];

    // Load A_k and u_shared into shared memory
    A_k[threadIdx.x] = Ainv[k * rowstride + threadIdx.x];
    u_shared[threadIdx.x] = u[threadIdx.x];

    // Compute k'th element of Ainv_u using block-wide reduction
    Ainv_u[threadIdx.x] = u_shared[threadIdx.x] * A_k[threadIdx.x];
    __syncthreads();
    for (int n = N >> 1; n > 0; n >>= 1) {
        if (threadIdx.x < n) {
            Ainv_u[threadIdx.x] += Ainv_u[threadIdx.x + n];
        }
        __syncthreads();
    }
    
    float prefact = -1.0f / (1.0f + Ainv_u[0]);

    for (int row = 0; row < N; row++) {
        // Load Ainv_shared into shared memory
        Ainv_shared[threadIdx.x] = Ainv[row * rowstride + threadIdx.x];
        __syncthreads();

        // Compute row'th element of Ainv_u using block-wide reduction
        Ainv_u[threadIdx.x] = u_shared[threadIdx.x] * Ainv_shared[threadIdx.x];
        for (int n = N >> 1; n > 0; n >>= 1) {
            if (threadIdx.x < n) {
                Ainv_u[threadIdx.x] += Ainv_u[threadIdx.x + n];
            }
            __syncthreads();
        }
        __syncthreads();

        // Update Ainv with computed result
        Ainv[row * rowstride + threadIdx.x] =
            Ainv_shared[threadIdx.x] + prefact * Ainv_u[0] * A_k[threadIdx.x];
    }
}