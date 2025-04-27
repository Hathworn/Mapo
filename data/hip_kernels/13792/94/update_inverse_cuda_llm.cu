#include "hip/hip_runtime.h"
#include "includes.h"

#define NMAX 1024

__global__ static void update_inverse_cuda(float *Ainv, float *u, int N, int rowstride, int k)
{
    __shared__ float A_k[NMAX], u_shared[NMAX], Ainv_u[NMAX], Ainv_shared[NMAX];

    // Load data into shared memory
    A_k[threadIdx.x] = Ainv[k * rowstride + threadIdx.x];
    u_shared[threadIdx.x] = u[threadIdx.x];

    // First, compute k'th element of Ainv_u using reduction
    Ainv_u[threadIdx.x] = u_shared[threadIdx.x] * A_k[threadIdx.x];
    __syncthreads();

    for (int offset = blockDim.x >> 1; offset > 0; offset >>= 1)
    {
        if (threadIdx.x < offset)
        {
            Ainv_u[threadIdx.x] += Ainv_u[threadIdx.x + offset];
        }
        __syncthreads();
    }

    float prefact = -1.0f / (1.0f + Ainv_u[0]);

    // Loop over rows to update Ainv
    for (int row = 0; row < N; row++)
    {
        // Load row into shared memory
        Ainv_shared[threadIdx.x] = Ainv[row * rowstride + threadIdx.x];
        __syncthreads();

        // Compute row'th element of Ainv_u using reduction
        Ainv_u[threadIdx.x] = u_shared[threadIdx.x] * Ainv_shared[threadIdx.x];
        __syncthreads();

        for (int offset = blockDim.x >> 1; offset > 0; offset >>= 1)
        {
            if (threadIdx.x < offset)
            {
                Ainv_u[threadIdx.x] += Ainv_u[threadIdx.x + offset];
            }
            __syncthreads();
        }

        // Update Ainv with the computed value
        if (threadIdx.x < rowstride)
        {
            Ainv[row * rowstride + threadIdx.x] =
                Ainv_shared[threadIdx.x] + prefact * Ainv_u[0] * A_k[threadIdx.x];
        }
    }
}