#include "hip/hip_runtime.h"
#include "includes.h"

#define threads 32
#define size 5

using namespace std;

__global__ void callOperationSharedDynamic(int *a, int *b, int *res, int k, int p, int n)
{
    // Calculate the unique thread index
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;
    if (tidx >= n || tidy >= n) return;
    int tid = tidx * n + tidy;

    // Declare shared memory dynamically
    extern __shared__ int data[];
    int *s_a = data;
    int *s_b = &s_a[size * size];
    int *s_res = &s_b[size * size];

    // Load values into shared memory
    s_a[tid] = a[tid];
    s_b[tid] = b[tid];

    // Perform operation and store in shared memory
    s_res[tid] = s_a[tid] - s_b[tid];
    if (s_res[tid] < k) {  // Directly use 'k' as parameter, no need for shared
        s_res[tid] = p;    // Directly use 'p' as parameter
    }

    // Write the result back to global memory
    res[tid] = s_res[tid];
}