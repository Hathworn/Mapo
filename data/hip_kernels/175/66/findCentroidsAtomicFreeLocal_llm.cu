#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findCentroidsAtomicFreeLocal(int afLocal, int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount)
{
    int const af_id = blockIdx.x;
    int const cluster_id = blockIdx.y;
    int const filter_id = threadIdx.x;
    extern __shared__ int shared_data[]; // Use shared memory for faster access
    int* shared_responses = &shared_data[filter_id * afLocal];

    int local_responses = 0;
    int local_count = 0;

    int pixel_start = af_id * afLocal;
    int pixel_end = min((af_id + 1) * afLocal, nPixels); // Use min for boundary check

    for (int i = pixel_start; i < pixel_end; i++)
    {
        if (cluster[i] == cluster_id)
        {
            local_responses += responses[filter_id*nPixels + i]; // Direct index calculation
            local_count++;
        }
    }

    shared_responses[filter_id] = local_responses; // Store intermediate results in shared memory
    __syncthreads(); // Ensure all threads have written to shared memory

    if (filter_id == 0) // Only one thread per block writes back to global memory
    {
        int idx = af_id * gridDim.y * blockDim.x + cluster_id;
        for (int i = 0; i < blockDim.x; i++) {
            centroidMass[idx] += shared_responses[i]; // Accumulate results from shared memory
            centroidCount[idx] += (i == filter_id ? local_count : 0); // Use the first thread to update the count
        }
    }
}