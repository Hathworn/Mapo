#include "hip/hip_runtime.h"
#include "includes.h"

__device__ static void myAtomicAdd(float *address, float value)
{
#if __CUDA_ARCH__ >= 200
    atomicAdd(address, value);
#else
    // cf. https://www.sharcnet.ca/help/index.php/CUDA_tips_and_tricks
    int oldval, newval, readback;

    oldval = __float_as_int(*address);
    newval = __float_as_int(__int_as_float(oldval) + value);
    while ((readback=atomicCAS((int *)address, oldval, newval)) != oldval)
    {
        oldval = readback;
        newval = __float_as_int(__int_as_float(oldval) + value);
    }
#endif
}

__global__ void computeCSRColSums(float *d_colSums, const float *d_systemMatrixVals, const int *d_systemMatrixRows, const int *d_systemMatrixCols, const size_t m, const size_t n)
{
    const size_t row = blockIdx.x * blockDim.x + threadIdx.x;

    if (row >= m)
        return;
        
    // Load row starts and ends in shared memory for coalesced access
    __shared__ int sharedRows[32]; // Assuming blockDim.x <= 32

    if (threadIdx.x == 0 || threadIdx.x == blockDim.x) {
        if (row <= m)
            sharedRows[threadIdx.x] = d_systemMatrixRows[row];
        if (row + 1 <= m)
            sharedRows[threadIdx.x + 1] = d_systemMatrixRows[row + 1];
    }
    __syncthreads();

    // Iterate over the elements within the row
    int rowStart = sharedRows[threadIdx.x];
    int rowEnd = sharedRows[threadIdx.x + 1];

    for (int cidx = rowStart; cidx < rowEnd; ++cidx)
    {
        myAtomicAdd(d_colSums + d_systemMatrixCols[cidx], d_systemMatrixVals[cidx]);
    }
}