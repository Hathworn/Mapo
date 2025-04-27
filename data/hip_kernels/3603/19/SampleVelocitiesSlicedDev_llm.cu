#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float length(float3 vec) {
    return sqrtf(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z);
}

__device__ float length4(float4 vec) {
    return sqrtf(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z);
}

__global__ void SampleVelocitiesSlicedDev(float* velocities, const uint slice, const float4* vels_data, const uint2* cellStartEnd, const uint* indices) {
    const uint cellid = gridDim.x * blockDim.x * slice + threadIdx.x * gridDim.x + blockIdx.x;
    uint2 cellStEnd = cellStartEnd[cellid];
    const uint part_in_cell = cellStEnd.y - cellStEnd.x;

    if (part_in_cell > 0) {
        float4 p = make_float4(0, 0, 0, 0);

        for (uint index = cellStEnd.x; index < cellStEnd.y; index++) {
            #ifndef REORDER
            uint idx = indices[index];
            float4 vel = vels_data[idx];
            #else
            float4 vel = vels_data[index];
            #endif

            p.x += vel.x;
            p.y += vel.y;
            p.z += vel.z;
        }

        // Compute velocity length and store result
        velocities[threadIdx.x * gridDim.x + blockIdx.x] = length4(p) / part_in_cell;
    } else {
        // No particles in cell, set velocity to 0
        velocities[threadIdx.x * gridDim.x + blockIdx.x] = 0.0f;
    }
}