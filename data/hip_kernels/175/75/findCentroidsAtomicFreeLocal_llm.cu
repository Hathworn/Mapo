#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findCentroidsAtomicFreeLocal(int afLocal, int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount)
{
    // Cache data in shared memory to minimize global accesses
    __shared__ int shared_responses[256]; // Adjust size based on actual use and occupancy
    __shared__ int shared_count[256];     // Adjust size based on block size and usage
    
    int const af_id = blockIdx.x;
    int const cluster_id = blockIdx.y;
    int const filter_id = threadIdx.x;
    int* filter_responses = &responses[filter_id * nPixels];
    
    int local_responses = 0;
    int local_count = 0;
    
    int pixel_start = af_id * afLocal;
    int pixel_end = (af_id + 1) * afLocal;
    
    pixel_end = pixel_end > nPixels ? nPixels : pixel_end;
    
    for (int i = pixel_start; i < pixel_end; i++)
    {
        if (cluster[i] == cluster_id)
        {
            local_responses += filter_responses[i];
            local_count++;
        }
    }
    
    // Use shared memory to accumulate results from threads
    shared_responses[filter_id] = local_responses;
    shared_count[filter_id] = local_count;
    
    __syncthreads();
    
    // Reduce phase for accumulation within block
    if (filter_id == 0)
    {
        int block_responses = 0;
        int block_count = 0;
        for (int i = 0; i < blockDim.x; i++)
        {
            block_responses += shared_responses[i];
            block_count += shared_count[i];
        }

        int idx = af_id * gridDim.y * blockDim.x + filter_id * 64 + cluster_id;
        // Write results from block to global memory
        centroidMass[idx] = block_responses;
        centroidCount[idx] = block_count;
    }
}