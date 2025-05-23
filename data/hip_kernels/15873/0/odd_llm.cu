#include "hip/hip_runtime.h"
#include "includes.h"
// tatami.cu

const unsigned nMax(100000000);
const unsigned nMaxSqrt(sqrt(nMax));

__global__ void odd(unsigned* v, unsigned base)
{
    unsigned i = (blockIdx.x * blockDim.x + threadIdx.x + base) * 2 + 7;
    unsigned k2 = i + 3;
    unsigned k3 = i + i - 4;

    while ((k2 <= k3) && ((i * k2) < nMax))
    {
        unsigned k4 = (nMax - 1) / i;
        if (k3 < k4) k4 = k3;

        // Avoid redundant synchronization by moving syncthreads out of the loop
        __syncthreads(); 
        // Calculate range boundaries once reducing repeated calculation inside loop
        unsigned start = k2 / 2;
        unsigned end = k4 / 2;

        for (unsigned j = start; j <= end; j++)
        {
            // Use atomicAdd for simplicity and consistency
            atomicAdd(&v[i * j], 1);
        }
        __syncthreads();

        // Increment values for the next iteration
        k2 += i + 1;
        k3 += i - 1;
    }
}