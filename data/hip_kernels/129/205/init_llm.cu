#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(int *vector, int N, int val)
{
    // Use `int` to `register` for faster access and reduce global memory transactions
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use branchless programming to avoid if-condition
    int assign_value = (idx < N) ? val : 0; // Default `0` will not matter if idx >= N
    vector[idx] = assign_value;

    // Alternatively, if `vector` size is guaranteed by the caller, remove the conditional entirely
    // vector[idx] = val;
}