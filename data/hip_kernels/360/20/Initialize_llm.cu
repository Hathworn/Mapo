#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Initialize(int size, unsigned int *randoms, int *bestSeen, int *origin, int *mis, int *incomplete) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure idx is within bounds before execution
    if (idx >= size) return;

    // Taus-step calculation optimized
    unsigned int z = randoms[idx];
    unsigned int b = (((z << 13) ^ z) >> 19);
    z = (((z & UINT_MAX) << 12) ^ b);

    // Set the origin to be self
    origin[idx] = idx;

    // Set the bestSeen value based on mis status
    bestSeen[idx] = (mis[idx] == 1) ? 1000001 : (mis[idx] == -1 ? (z % 1000000) : 0);

    // Write out new random value for seeding
    randoms[idx] = z;

    // Only reset incomplete if idx is 0
    if (idx == 0)
        incomplete[0] = 0;
}