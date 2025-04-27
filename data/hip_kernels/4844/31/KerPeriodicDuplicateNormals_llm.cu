#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerPeriodicDuplicateNormals(unsigned n, unsigned pini, const unsigned *listp, float3 *normals, float3 *motionvel) {
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // Compute particle index.
    if (p < n) {
        unsigned pnew = p + pini;
        unsigned rp = listp[p];
        unsigned pcopy = rp & 0x7FFFFFFF;
        normals[pnew] = normals[pcopy]; // Duplicate normals.
        if (motionvel) {
            motionvel[pnew] = motionvel[pcopy]; // Duplicate motion velocities if not null.
        }
    }
}