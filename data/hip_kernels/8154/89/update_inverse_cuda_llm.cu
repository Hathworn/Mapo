#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void update_inverse_cuda (float *Ainv, float *u, int N, int rowstride, int k)
{
    __shared__ float A_k[NMAX], u_shared[NMAX], Ainv_u[NMAX], Ainv_shared[NMAX];
    
    // Load A_k and u_shared into shared memory
    int tid = threadIdx.x;
    A_k[tid] = Ainv[k * rowstride + tid];
    u_shared[tid] = u[tid];
    
    // Compute the k'th element of Ainv_u
    Ainv_u[tid] = u_shared[tid] * A_k[tid];
    __syncthreads();
    
    // Efficient reduction to compute sum into Ainv_u[0]
    for (int stride = N >> 1; stride > 0; stride >>= 1) {
        if (tid < stride) {
            Ainv_u[tid] += Ainv_u[tid + stride]; // Sum partial results
        }
        __syncthreads();
    }
    
    float prefact = -1.0f / (1.0f + Ainv_u[0]);
    
    // Update Ainv for each row
    for (int row = 0; row < N; row++) {
        Ainv_shared[tid] = Ainv[row * rowstride + tid];
        __syncthreads();
        
        Ainv_u[tid] = u_shared[tid] * Ainv_shared[tid];
        
        // Efficient reduction to compute sum into Ainv_u[0]
        for (int stride = N >> 1; stride > 0; stride >>= 1) {
            if (tid < stride) {
                Ainv_u[tid] += Ainv_u[tid + stride]; // Sum partial results
            }
            __syncthreads();
        }
        
        // Update Ainv[row]
        Ainv[row * rowstride + tid] = Ainv_shared[tid] + prefact * Ainv_u[0] * A_k[tid];
        __syncthreads();
    }
}