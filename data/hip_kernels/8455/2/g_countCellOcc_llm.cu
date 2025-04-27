#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void g_countCellOcc(uint *_hash, uint *_cellOcc, uint _pixCount, uint _hashCellCount)
{
    // Calculate the global thread index
    uint idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Avoid double calculation and reduce memory access
    if (idx < _pixCount) {
        uint hash_value = _hash[idx];
        if (hash_value < _hashCellCount) {
            atomicAdd(&(_cellOcc[hash_value]), 1);
        }
    }
}