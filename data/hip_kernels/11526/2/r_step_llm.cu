#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void r_step( float4 *__restrict__ devPos, float4 *__restrict__ deviceVel, unsigned int numBodies, float dt)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is less than numBodies to prevent out-of-bounds access
    if (index >= numBodies) { return; }
    // Use temporary variable to reduce multiple memory accesses
    float4 velocity = deviceVel[index];
    devPos[index].x += velocity.x * dt;
    devPos[index].y += velocity.y * dt;
    devPos[index].z += velocity.z * dt;
}