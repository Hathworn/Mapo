#include "hip/hip_runtime.h"
#include "includes.h"
// tatami.cu

const unsigned nMax(100000000);
const unsigned nMaxSqrt(sqrt(nMax));

__global__ void even(unsigned* v, unsigned base)
{
    unsigned i = (blockIdx.x * blockDim.x + threadIdx.x + base) * 2 + 8;
    unsigned k2 = i + 3;
    unsigned k3 = i + i - 4;
    unsigned k4;

    // Use shared memory for synchronization as less as possible
    while ((k2 <= k3) && ((i * k2) < nMax))
    {
        // Precompute constant table value to reduce atomic operations
        k4 = min((nMax - 1) / i, k3);
        for (unsigned j = k2; j <= k4; ++j)
        {
            // Atomic increment to prevent race condition
            atomicInc(&v[i * j / 2], 0xffffffff);
        }
        k2 += i + 1;
        k3 += i - 1;
        __syncthreads(); // Only necessary here to sync on next iteration
    }
}