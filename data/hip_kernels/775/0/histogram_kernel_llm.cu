```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define H 	64

// Default values
int N = 10000; 		//Size
int T = 32; 		//BlockSize
int B = 4; 		//Blocks

// Host Variables
int* HostData;
int* HostHist;
int* HostTimer=NULL;

// Device Variables
int* DeviceData;
int* DeviceHist;
int* DeviceTimer=NULL;

// Timer Variables
struct timeval CPU_Time_start, CPU_Time_end;
struct timeval GPU_Time_start, GPU_Time_end;
struct timeval DeviceToHost_start, DeviceToHost_end;
struct timeval HostToDevice_start, HostToDevice_end;
struct timeval CPU_Partial_Time_start, CPU_Partial_Time_end;
struct timeval CPU_Cleanup_Time_start, CPU_Cleanup_Time_end;
struct timeval Total_Time_start, Total_Time_end;


// Function Declaration
void Cleanup(void);
void HistogramSequential(int* result, int* data, int size);

// Histogram kernel

__global__ void histogram_kernel(int* PartialHist, int* DeviceData, int dataCount, int* timer)
{
    // Get thread ID and global ID
    unsigned int tid = threadIdx.x;
    unsigned int gid = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;
    clock_t start_clock = 0;
    clock_t stop_clock = 0;

    // Start the timer in the first thread of the block
    if (tid == 0)
    {
        start_clock = clock();
    }

    // Shared memory for block histogram
    __shared__ int BlockHist[H];
    __shared__ int hist[H];

    // Initialize shared memory
    BlockHist[tid] = 0;
    if (tid < H)
    {
        hist[tid] = 0;
    }
    __syncthreads();

    // Populate shared memory hist
    for (int pos = gid; pos < dataCount; pos += stride)
    {
        atomicAdd(&hist[DeviceData[pos]], 1);
    }
    __syncthreads();

    // Aggregate hist into BlockHist
    if (tid < H)
    {
        BlockHist[tid] = hist[tid];
    }
    __syncthreads();

    // Write to global memory
    if (tid < H)
    {
        PartialHist[blockIdx.x * H + tid] = BlockHist[tid];
    }
    
    // Stop the timer in the first thread of the block
    if (tid == 0)
    {
        stop_clock = clock();
        timer[blockIdx.x * 2] = start_clock;
        timer[blockIdx.x * 2 + 1] = stop_clock;
    }
}