#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void force_eval(float4 *set_A, float4 *set_B, int *indices, float4 *force_vectors, int array_length)
{
    // Compute unique global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds to prevent accessing out of array
    if (idx < array_length) {
        // Load indices from global to register
        int indexA = indices[idx * 2];
        int indexB = indices[idx * 2 + 1];

        // Load elements from global memory to registers
        float4 a = set_A[indexA];
        float4 b = set_B[indexB];

        // Calculate the force vector (example operation)
        float4 force;
        force.x = a.x - b.x;
        force.y = a.y - b.y;
        force.z = a.z - b.z;
        force.w = a.w - b.w;

        // Store the result back to global memory
        force_vectors[idx] = force;
    }
}