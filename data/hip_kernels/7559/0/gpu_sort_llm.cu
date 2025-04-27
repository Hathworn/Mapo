#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256
#define CHUNK_SIZE 16

int randNotSeeded = 1;

// Inline the insertion sort for better performance
__device__ void insertionSort(int *array, int a, int b)
{
    int current;
    for (int i = a + 1; i < b; i++)
    {
        current = array[i];
        int j = i - 1;
        // Combine condition checks to reduce branch instructions
        while (j >= a && current < array[j])
        {
            array[j + 1] = array[j];
            j--;
        }
        array[j + 1] = current;
    }
}

__global__ void gpu_sort(int *d_array, int size, int chunkSize)
{
    // Pre-calculate index to avoid recalculating within the kernel
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    int a = idx * chunkSize;
    if (a >= size) return;

    int b = min(a + chunkSize, size); // Use min to directly compute the boundary

    insertionSort(d_array, a, b);
}