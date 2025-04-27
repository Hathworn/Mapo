#include "hip/hip_runtime.h"
#include "includes.h"

//=== Vector arithmetic ======================================================
//=== Vector-and-scalar arithmetic ===========================================
//=== Vector comparison ======================================================
//=== Vector-and-scalar comparison ===========================================
//=== Vector math (one argument) =============================================
//=== Vector math (two arguments) ============================================

__global__ void vec_scalarSubf(size_t n, float *result, float x, float *y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    if (id < n)
    {
        // Optimized subtraction operation, directly accessed
        result[id] = x - y[id];
    }
}