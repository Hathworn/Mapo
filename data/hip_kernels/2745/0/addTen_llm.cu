#include "hip/hip_runtime.h"
#include "includes.h"
//============================================================================
// Name        : CudaMap.cu
// Author      : Hang
//============================================================================

using namespace std;

__global__ void addTen(float* d, int count) {

    // Optimize calculation of tid using simplified expressions
    int tid = blockIdx.x * blockDim.x * blockDim.y * blockDim.z
              + threadIdx.z * blockDim.x * blockDim.y
              + threadIdx.y * blockDim.x + threadIdx.x;

    // Use early return to avoid unnecessary indexing
    if (tid >= count) return;

    d[tid] += 10; // Simplify addition operation
}