#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_lucas(long* nArray, long* dArray, int* rArray, long len) {
    int bx = blockIdx.x;
    int tx = threadIdx.x;
    
    // Compute global thread index
    long memIndex = bx * TILE_WIDTH + tx;
    if (memIndex >= len) return; // Boundary check, avoids unnecessary thread computations

    long long d = (long long) dArray[memIndex];
    long long n = (long long) nArray[memIndex];
    long long q = (1 - d) / 4;
    long long u = 0, v = 2, u2 = 1, v2 = 1, q2 = 2 * q;
    long long t = (n + 1) / 2;
    int length = 32 - __clz(t);

    // Use a single loop to minimize the branch costs and potential instruction stalls
    for (int i = 0; i < length; ++i) {
        u2 = (u2 * v2) % n;
        v2 = (v2 * v2 - q2) % n;

        if (t & 1) {
            long long uTemp = u;
            u = (u2 * v + u * v2);
            v = v2 * v + u2 * uTemp * d;
            if (u & 1) u += n;
            u = (u / 2) % n;
            if (v & 1) v += n;
            v = (v / 2) % n;
        }

        q = (q * q) % n;
        q2 = q + q;
        t >>= 1;
    }

    rArray[memIndex] = (u == 0);
}