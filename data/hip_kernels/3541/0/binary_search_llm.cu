#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binary_search(int* a, int* b, bool* c, int sizeofa) // optimized kernel function
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= sizeofa) return; // Avoid out-of-bounds access
    int key = b[index];
    int min = 0, max = sizeofa - 1;
    int mid;
    bool found = false;

    while (min <= max) 
    {
        mid = (min + max) / 2;
        if (key == a[mid]) 
        {
            found = true;
            break; // Key found
        } 
        else if (key < a[mid]) 
        {
            max = mid - 1;
        } 
        else 
        {
            min = mid + 1;
        }
    }

    c[index] = found;

    // Remove print statements for better performance
}