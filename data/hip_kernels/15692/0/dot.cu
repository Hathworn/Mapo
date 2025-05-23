#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;
#ifndef __HIPCC__
#define __HIPCC__
#endif

/*
CUDA C has a __shared__ memory section where a copy of var is made for each block & threads within a block can all access var but cannot see or modify copy in other blocks
Must synchronize, if thread A writes to var and thread B wants to modify, must wait and ensure write is done else race condition occurs where correctness of var unknown
Addl shared mem buffers are physically on GPU, as opposed to off-chip DRAM which makes for much faster calls and reduced latency
*/

#define imin(a, b) (a < b ? a : b)

const int N = 33 * 1024;
const int threadsPerBlock = 256;
const int blocksPerGrid = imin(32, (N + threadsPerBlock - 1) / threadsPerBlock); // use either all blocks if N large, or calc req blocks by taking smallest multiple of N


__global__ void dot(float *a, float *b, float *c)
{
__shared__ float cache[threadsPerBlock]; //arr of caches equal to size of 256, each thread has spot to store temp vals & must wait for all writes to finish before another iteration where val retrieved for more modification
int threadID = threadIdx.x + blockIdx.x * blockDim.x;
int cacheID = threadIdx.x;
float temp = 0;

//iteratively take sum of products (dot prod) by creating threads for each arr elem
//all threads will technically run at same hardware location, however abstract into larger set incase vector exceeds length
//for small enough vals each thread theoretically computes single sum, yet again for large vecs, can continue greater iterations
while (threadID < N)
{
temp += a[threadID] * b[threadID];
threadID += blockDim.x * gridDim.x;
}
cache[cacheID] = temp; //shared mem buffer to store running sum per thread
__syncthreads(); //Sync threads for blocks to ensure cache done being written to by all parallel processes

//Apply reduction to sum vals, whereby input arr made into smaller output arr
//Apply multiple threads for sum, each one adds two vals of cache[], resulting in log2(threadsPerBlock) steps
//Each thread does two computations, therefore 2x per thread. There are threadsPerBlock running in parallel, thus 2^threadsPerBlock computations being done per step
int i = blockDim.x / 2; //each thread does two tasks, thus need half as many
while (i != 0) //run in parallel so each step halves size of cache until reach 1 elem in arr
{
if (cacheID < i) //check cacheID being summed less than num operators
{
cache[cacheID] += cache[cacheID + i]; //add curr cache val to ith
}
__syncthreads(); //sync threads again per each iteration to ensure cache data correct before mod
i /= 2; //every other cache index
}

//Final reduction, each block has single sum left & store to global mem, use single thread rather than multiple for writing to reduce mem req
//Typically in better programs, GPU stops summing once it's reached a small enough number as threads used << threads available (e.g. using 32 out of 256 threads)
//In that case, work passed on to CPU to quickly run remaining sum sequentially
if (cacheID == 0)
{
c[blockIdx.x] = cache[0]; //send to curr block
}
}