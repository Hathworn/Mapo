#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vel_step( float4 *__restrict__ deviceVel, float3 *__restrict__ accels, unsigned int numBodies, float dt)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if the index is within bounds
    if (index >= numBodies) { return; }
    
    // Update the velocity by combining operations
    float half_dt = 0.5f * dt;
    float3 accel = accels[index];
    deviceVel[index].x += accel.x * half_dt;
    deviceVel[index].y += accel.y * half_dt;
    deviceVel[index].z += accel.z * half_dt;
}