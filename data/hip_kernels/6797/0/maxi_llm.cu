#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void maxi(int *a, int *b, int n)
{
    // Calculate the index of the current thread within the block
    int tid = threadIdx.x;
    // Calculate the global index of the current thread
    int index = 256 * blockIdx.x + tid;
    // Shared memory for block-wide maximum computation
    __shared__ int shared_max[256];
    
    // Initialize shared memory
    shared_max[tid] = (index < n) ? a[index] : INT_MIN;
    __syncthreads();
    
    // Perform reduction to find maximum within the block
    for (int stride = 128; stride > 0; stride >>= 1) {
        if (tid < stride) {
            shared_max[tid] = max(shared_max[tid], shared_max[tid + stride]);
        }
        __syncthreads();
    }
    
    // Write the maximum value found by this block to the result array
    if (tid == 0) {
        b[blockIdx.x] = shared_max[0];
    }
}