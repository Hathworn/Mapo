#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int satisfies(int i, int j, int *A, int *B)
{
    return (A[i] <= B[j]);
}

__global__ void MergePath(int *A, int *B, int* C, int *x, int *y, int n)
{
    int num_of_threads = blockDim.x;
    int idx = threadIdx.x;
    bool flag = false;

    // Initialize base case for the 0th index thread
    if (idx == 0)
    {
        x[idx] = 0;
        y[idx] = 0;
        flag = true;
    }

    int A_start = idx * (2 * n) / num_of_threads; // Calculate starting indices
    int B_start = max(0, A_start - (n - 1));
    A_start = min(n - 1, A_start);
    int length_of_array = (B_start == 0) ? (A_start + 1) : (n - B_start);

    int left = 0, right = length_of_array - 1;

    // Perform binary search to find the intersection point
    while (left <= right && !flag)
    {
        int mid = left + (right - left) / 2;
        int I = A_start - mid;
        int J = B_start + mid;

        if (!satisfies(I, J, A, B))
        {
            left = mid + 1;
        }
        else
        {
            if (J == 0 || I == n - 1 || !satisfies(I + 1, J - 1, A, B))
            {
                x[idx] = (I + 1);
                y[idx] = (J);
                flag = true;
            }
            else
            {
                right = mid;
            }
        }
    }

    if (!flag)
    {
        left--;
        x[idx] = (A_start - left);
        y[idx] = n;
    }
    __syncthreads();

    // Determine segment for merging
    int end_x = (idx == num_of_threads - 1) ? n : x[idx + 1];
    int end_y = (idx == num_of_threads - 1) ? n : y[idx + 1];
    int cur_x = x[idx];
    int cur_y = y[idx];
    int put_at = cur_x + cur_y;

    // Merge the sorted segments
    while (cur_x < end_x && cur_y < end_y)
    {
        if (A[cur_x] <= B[cur_y])
        {
            C[put_at++] = A[cur_x++];
        }
        else
        {
            C[put_at++] = B[cur_y++];
        }
    }

    // Copy remaining elements
    while (cur_x < end_x)
    {
        C[put_at++] = A[cur_x++];
    }
    while (cur_y < end_y)
    {
        C[put_at++] = B[cur_y++];
    }
}