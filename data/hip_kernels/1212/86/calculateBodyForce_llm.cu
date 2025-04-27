#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void calculateBodyForce(float4 *p, float4 *v, float dt, int n) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < n) {
        float Fx = 0.0f; float Fy = 0.0f; float Fz = 0.0f;
        float4 pi = p[i]; // Cache position i to reduce global memory accesses

        for (int tile = 0; tile < gridDim.x; tile++) {
            __shared__ float3 shared_position[BLOCK_SIZE];
            float4 temp_position = p[tile * blockDim.x + threadIdx.x];
            shared_position[threadIdx.x] = make_float3(temp_position.x, temp_position.y, temp_position.z);
            __syncthreads(); // Ensure all tile data is available in shared memory

            // Use threadIdx to unroll loop partially and optimize shared memory access
            #pragma unroll 4
            for (int j = 0; j < BLOCK_SIZE; j++) {
                float dx = shared_position[j].x - pi.x;
                float dy = shared_position[j].y - pi.y;
                float dz = shared_position[j].z - pi.z;
                float distSqr = dx*dx + dy*dy + dz*dz + SOFTENING;
                float invDist = rsqrtf(distSqr);
                float invDist3 = invDist * invDist * invDist;

                Fx += dx * invDist3; Fy += dy * invDist3; Fz += dz * invDist3;
            }
            __syncthreads(); // Synchronize before moving to the next tile
        } // End of tile loop

        v[i].x += dt * Fx; v[i].y += dt * Fy; v[i].z += dt * Fz;
    } // End of if
}