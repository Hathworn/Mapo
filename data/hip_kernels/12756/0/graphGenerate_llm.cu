#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void graphGenerate (float *a, float *b, int n) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure grid size doesn't exceed data size.
    if (i < n) {
        // Avoid recomputation inside the loop.
        int threadIndex = threadIdx.x;
        a[i] = threadIndex * 2;
        b[i] = threadIndex;
    }
}