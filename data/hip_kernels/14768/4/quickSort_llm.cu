#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void quickSort(int *x, int *dfirst, int *dlast, int *list)
{
    // Get thread index
    int idx = threadIdx.x;
    int first = dfirst[idx];
    int last = dlast[idx];
    list[idx] = 0;

    // Perform sorting if first index is less than last
    if (first < last)
    {
        // Initializations
        int pivot = first;
        int i = first;
        int j = last;
        int temp;

        // Repeatedly partition array until completed
        while (i < j)
        {
            while (x[i] <= x[pivot] && i < last)
                i++; // Increment i while condition holds

            while (x[j] > x[pivot])
                j--; // Decrement j while condition holds

            // Swap elements at i and j
            if (i < j)
            {
                temp = x[i];
                x[i] = x[j];
                x[j] = temp;
            }
        }

        // Swap pivot with element at j
        temp = x[pivot];
        x[pivot] = x[j];
        x[j] = temp;

        // Determine if further sorting is needed
        for (i = first; i <= last - 1; i++) // Use last - 1 for index correctness
        {
            if (x[i] > x[i + 1])
            {
                list[idx] = j + 1;
                break; // Break loop once condition is met
            }
        }
    }
}