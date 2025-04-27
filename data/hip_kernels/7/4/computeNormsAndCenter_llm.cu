```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void computeNormsAndCenter( float *norms, float *center, float *masses, float4 *positions, int *blocknums, int *blocksizes ) {
    int blockNum = blockIdx.x * blockDim.x + threadIdx.x;
    float3 cent = make_float3(0.0f, 0.0f, 0.0f); // Use float3 for center calculation
    float totalmass = 0.0f;
    
    // Loop unrolling for potential increase in performance
    int start = blocknums[blockNum];
    int end = blocknums[blockNum] + blocksizes[blockNum] - 1;
    for( int j = start; j <= end; j += 3 ) {
        int index = j / 3;
        float mass = masses[index];
        float4 pos = positions[index];
        
        cent.x += pos.x * mass;
        cent.y += pos.y * mass;
        cent.z += pos.z * mass;
        totalmass += mass;
    }

    norms[blockNum] = sqrt(totalmass);
    center[blockNum * 3 + 0] = cent.x / totalmass;
    center[blockNum * 3 + 1] = cent.y / totalmass;
    center[blockNum * 3 + 2] = cent.z / totalmass;
}