```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ uint scanLocalMem(const uint val, uint* s_data) {
    int idx = threadIdx.x;
    s_data[idx] = 0.0f;
    __syncthreads();

    idx += blockDim.x;

// Reduced synchronizations for efficiency
    uint t;
    s_data[idx] = val;
    __syncthreads();
    if (idx >= 1) s_data[idx] += s_data[idx - 1];
    if (idx >= 2) s_data[idx] += s_data[idx - 2];
    if (idx >= 4) s_data[idx] += s_data[idx - 4];
    if (idx >= 8) s_data[idx] += s_data[idx - 8];
    if (idx >= 16) s_data[idx] += s_data[idx - 16];
    if (idx >= 32) s_data[idx] += s_data[idx - 32];
    if (idx >= 64) s_data[idx] += s_data[idx - 64];
    if (idx >= 128) s_data[idx] += s_data[idx - 128];

    return s_data[idx-1];
}

__global__ void scan(uint *g_odata, uint* g_idata, uint* g_blockSums, const int n, const bool fullBlock, const bool storeSum) {
    __shared__ uint s_data[512];

    uint4 tempData;
    uint4 threadScanT;
    uint res;
    uint4* inData  = (uint4*) g_idata;
    const int gid = (blockIdx.x * blockDim.x) + threadIdx.x;
    const int tid = threadIdx.x;
    const int i = gid * 4;

    if (fullBlock || i + 3 < n) {
        tempData = inData[gid];
        threadScanT.x = tempData.x;
        threadScanT.y = tempData.y + threadScanT.x;
        threadScanT.z = tempData.z + threadScanT.y;
        threadScanT.w = tempData.w + threadScanT.z;
        res = threadScanT.w;
    } else {
        threadScanT.x = (i < n) ? g_idata[i] : 0.0f;
        threadScanT.y = ((i+1 < n) ? g_idata[i+1] : 0.0f) + threadScanT.x;
        threadScanT.z = ((i+2 < n) ? g_idata[i+2] : 0.0f) + threadScanT.y;
        threadScanT.w = ((i+3 < n) ? g_idata[i+3] : 0.0f) + threadScanT.z;
        res = threadScanT.w;
    }

    res = scanLocalMem(res, s_data);
    __syncthreads();

    if (storeSum && tid == blockDim.x-1) {
        g_blockSums[blockIdx.x] = res + threadScanT.w;
    }

    uint4* outData = (uint4*) g_odata;
    tempData.x = res;
    tempData.y = res + threadScanT.x;
    tempData.z = res + threadScanT.y;
    tempData.w = res + threadScanT.z;

    if (fullBlock || i + 3 < n) {
        outData[gid] = tempData;
    } else {
        if (i < n) {
            g_odata[i] = tempData.x;
            if ((i+1) < n) { g_odata[i+1] = tempData.y; }
            if ((i+2) < n) { g_odata[i+2] = tempData.z; }
        }
    }
}