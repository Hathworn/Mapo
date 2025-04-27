#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelProcessEventsBatchAsync(uint8_t* gpuEventsX,uint8_t* gpuEventsY,int gpuEventListSize, float* gpuFilter, int fsx, int fsy, int fsz, float* gpuBuffer, int ringBufferIdx, int bsx, int bsy, int bsz, int fs_xy, int fn)
{
    // Calculate filter idx
    int filterPos = threadIdx.x + blockIdx.x * blockDim.x;

    // Per block shared memory
    __shared__ uint8_t gpuEventListSharedX[MAX_SHARED_GPU_EVENTS];
    __shared__ uint8_t gpuEventListSharedY[MAX_SHARED_GPU_EVENTS];

    // How many runs do we need to process all events
    int processingRuns = (gpuEventListSize + MAX_SHARED_GPU_EVENTS - 1) / MAX_SHARED_GPU_EVENTS;
    
    // Events for each thread to read
    int eventReadsPerThread = (MAX_SHARED_GPU_EVENTS + blockDim.x - 1) / blockDim.x;

    // Offset in global event buffer
    int globalEventIdx = threadIdx.x;

    // Idx valid
    if (filterPos < fn) {
        // Read filter coefficient from global memory
        float filterVal = gpuFilter[filterPos];

        // Compute x, y, z coordinates in buffer
        int fz = filterPos / fs_xy;
        int fxy = filterPos % fs_xy;
        int fy = fxy / fsx;
        int fx = fxy % fsx;

        // Convert buffer coordinates (mirror all axes -> convolution instead of correlation)
        int bz = ((ringBufferIdx + (fsz - 1) - fz ) % bsz);
        int bx_tmp = fsx / 2 - fx;
        int by_tmp = fsy / 2 - fy;
        int bPos_tmp = bz * bsy * bsx;

        int sharedEventCnt = MAX_SHARED_GPU_EVENTS;

        // Iterate over event list in blocks, stored in shared memory
        for(int runIdx = 0; runIdx < processingRuns; runIdx++) {
            // Last run? Compute size of shared event list
            if(runIdx + 1 == processingRuns) {
                sharedEventCnt = gpuEventListSize % MAX_SHARED_GPU_EVENTS;
            }

            // Compute index in shared memory
            int localEventIdx = threadIdx.x;

            // Fill the shared memory either with MAX_SHARED_GPU_EVENTS
            for(int i = 0; i < eventReadsPerThread; i++) {
                // Valid indices
                if(globalEventIdx < gpuEventListSize) {
                    // Load event into shared memory
                    if(localEventIdx < sharedEventCnt) {
                        gpuEventListSharedX[localEventIdx] = gpuEventsX[globalEventIdx];
                        gpuEventListSharedY[localEventIdx] = gpuEventsY[globalEventIdx];
                    }
                }
                // Goto next event for which this thread is responsible
                localEventIdx += blockDim.x;
                globalEventIdx += blockDim.x;
            }

            // Synchronize threads and wait until shared memory is filled
            __syncthreads();

            // Iterate over every event block in shared memory
            for(localEventIdx = 0; localEventIdx < sharedEventCnt; localEventIdx++) {
                // Compute corresponding buffer coordinate
                int bx = bx_tmp + gpuEventListSharedX[localEventIdx];
                int by = by_tmp + gpuEventListSharedY[localEventIdx];

                // Check for valid buffer position (flip buffer z)
                if(bx >= 0 && bx < bsx && by >= 0 && by < bsy) {
                    int bufferPos = bPos_tmp + by * bsx + bx;
                    // Add each filter coefficient to the global buffer
                    atomicAdd(gpuBuffer + bufferPos, filterVal);
                }
            }
            __syncthreads();  // Ensures completion of processing before next iteration
        }
    }
}