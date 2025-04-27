#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void findCentroidsAtomicFreeReduce(int afLocal, int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount)
{
    int const af_id = blockIdx.x;
    int const cluster_id = blockIdx.y;
    int const filter_id = threadIdx.x;
    
    extern __shared__ int shared_data[]; // Use shared memory for intermediate storage

    int* shared_mass = shared_data;
    int* shared_count = shared_data + blockDim.x * gridDim.y; // Ensure non-overlapping allocation

    shared_mass[filter_id * gridDim.y + cluster_id] = 0;
    shared_count[filter_id * gridDim.y + cluster_id] = 0;

    __syncthreads();

    // Only one thread needs to do this
    if (af_id == 0)
    {
        int idx0 = filter_id * 64 + cluster_id;
        
        for (int i = 0; i < gridDim.x; i++)
        {
            int idxother = i * gridDim.y * blockDim.x + idx0;
            
            atomicAdd(&shared_mass[filter_id * gridDim.y + cluster_id], centroidMass[idxother]);
            atomicAdd(&shared_count[filter_id * gridDim.y + cluster_id], centroidCount[idxother]);
        }

        __syncthreads(); // Ensure all atomic operations are complete

        // Write back results to global memory
        if (filter_id == 0)
        {
            centroidMass[idx0] = shared_mass[filter_id * gridDim.y + cluster_id];
            centroidCount[idx0] = shared_count[filter_id * gridDim.y + cluster_id];
        }
    }
}