#include "hip/hip_runtime.h"
#include "includes.h"

#define threads 32
#define size 5

using namespace std;

__global__ void callOperation(int *a, int *b, int *res, int k, int p, int n)
{
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;

    // Use a single if condition to reduce branching and a warp shuffle
    if (tidx < n && tidy < n) {
        int tid = tidx * n + tidy;
        int temp = a[tid] - b[tid];
        res[tid] = (temp < k) ? p : temp;
    }
}