#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerPeriodicDuplicateNormals(unsigned n, unsigned pini, const unsigned *listp, float3 *normals, float3 *motionvel)
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x;
    if (p < n) {
        unsigned pnew = p + pini;
        unsigned rp = listp[p];
        unsigned pcopy = (rp & 0x7FFFFFFF);

        // Avoid recalculating 'pcopy' when copying normals
        float3 normal = normals[pcopy];
        normals[pnew] = normal;

        if (motionvel) {
            float3 velocity = motionvel[pcopy];
            motionvel[pnew] = velocity;
        }
    }
}