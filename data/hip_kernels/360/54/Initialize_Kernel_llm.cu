#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Initialize_Kernel(int size, unsigned int *randoms, int *bestSeen, int *origin, int *mis, int *incomplete)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size)
    {
        // Optimize random number generation using bit manipulation
        unsigned int z = randoms[idx];
        unsigned int b = (((z << 13) ^ z) >> 19);
        z = (((z & UINT_MAX) << 12) ^ b);

        // Initialize origin and bestSeen
        origin[idx] = idx;
        int status = mis[idx];
        bestSeen[idx] = (status == -1) ? (z % 1000000) : (status == 1 ? 1000001 : 0);

        // Update randoms with new generated value
        randoms[idx] = z;
    }

    // Efficiently reset incomplete value once, ensuring it only runs when idx is 0
    if (idx == 0)
    {
        incomplete[0] = 0;
    }
}