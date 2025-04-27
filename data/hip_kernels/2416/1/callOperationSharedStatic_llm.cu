#include "hip/hip_runtime.h"
#include "includes.h"

#define threads 32
#define size 5

using namespace std;

__global__ void callOperationSharedStatic(int *a, int *b, int *res, int k, int p, int n)
{
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;

    if (tidx >= n || tidy >= n) {
        return;
    }

    int tid = tidx * n + tidy;

    // Use individual shared memory variables instead of arrays for each thread
    __shared__ int s_k, s_p;
    __shared__ int s_a[size * size], s_b[size * size], s_res[size * size];

    if (threadIdx.x == 0 && threadIdx.y == 0) {
        s_k = k;
        s_p = p;
    }

    // Synchronize to ensure shared memory initialization is done
    __syncthreads();

    s_a[tid] = a[tid];
    s_b[tid] = b[tid];
    s_res[tid] = s_a[tid] - s_b[tid];

    if (s_res[tid] < s_k) {
        s_res[tid] = s_p;
    }

    // Write result back to global memory
    res[tid] = s_res[tid];
}