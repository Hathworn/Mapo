#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel launch for better occupancy and warp utilization
__global__ void lyra2Z_gpu_hash_32_sm2(uint32_t threads, uint32_t startNounce, uint64_t *g_hash, uint32_t *resNonces) {
    // Calculate the thread index
    uint32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread does not work if beyond thread limit
    if (idx >= threads) return;
    
    // Shared memory for intermediate computations to reduce global memory access
    __shared__ uint64_t sharedData[32];
    
    // Load initial hash value into shared memory and synchronize threads
    sharedData[threadIdx.x] = g_hash[idx];
    __syncthreads();
    
    // Compute next hash value using shared memory to lower global memory access latency
    uint64_t newHash = sharedData[threadIdx.x] ^ startNounce;
    
    // Write result to global memory, use atomic to avoid race condition
    atomicAdd(&resNonces[idx], newHash % threads);
}