#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void change_theta(const int ncoord, const float3 *theta, float4 *thetax, float4 *thetay, float4 *thetaz) {
    unsigned int pos = blockIdx.x * blockDim.x + threadIdx.x;

    // Use strided loop for coalesced access and to handle large ncoord
    for (unsigned int i = pos; i < ncoord; i += gridDim.x * blockDim.x) {
        const float3 t0 = theta[i * 4];
        const float3 t1 = theta[i * 4 + 1];
        const float3 t2 = theta[i * 4 + 2];
        const float3 t3 = theta[i * 4 + 3];

        thetax[i] = make_float4(t0.x, t1.x, t2.x, t3.x); // Pack the x components
        thetay[i] = make_float4(t0.y, t1.y, t2.y, t3.y); // Pack the y components
        thetaz[i] = make_float4(t0.z, t1.z, t2.z, t3.z); // Pack the z components
    }
}