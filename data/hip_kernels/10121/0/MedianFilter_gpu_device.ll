; ModuleID = '../data/hip_kernels/10121/0/main.cu'
source_filename = "../data/hip_kernels/10121/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16MedianFilter_gpuPtiiE8surround = internal unnamed_addr addrspace(3) global [256 x [9 x i16]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16MedianFilter_gpuPtii(i16 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %5, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = mul nuw nsw i32 %19, %17
  %22 = add nuw nsw i32 %21, %11
  %23 = icmp sge i32 %12, %1
  %24 = icmp sge i32 %20, %2
  %25 = select i1 %23, i1 true, i1 %24
  %26 = icmp eq i32 %12, 0
  %27 = or i1 %26, %25
  br i1 %27, label %288, label %28

28:                                               ; preds = %3
  %29 = add nsw i32 %1, -1
  %30 = icmp eq i32 %12, %29
  %31 = icmp eq i32 %20, 0
  %32 = select i1 %30, i1 true, i1 %31
  %33 = add nsw i32 %2, -1
  %34 = icmp eq i32 %20, %33
  %35 = select i1 %32, i1 true, i1 %34
  br i1 %35, label %288, label %36

36:                                               ; preds = %28
  %37 = add nsw i32 %12, -1
  %38 = add nsw i32 %20, -1
  %39 = sext i32 %37 to i64
  %40 = mul nsw i32 %38, %1
  %41 = sext i32 %40 to i64
  %42 = getelementptr i16, i16 addrspace(1)* %0, i64 %39
  %43 = getelementptr i16, i16 addrspace(1)* %42, i64 %41
  %44 = load i16, i16 addrspace(1)* %43, align 2, !tbaa !7, !amdgpu.noclobber !5
  %45 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 0
  store i16 %44, i16 addrspace(3)* %45, align 2, !tbaa !7
  %46 = mul nsw i32 %20, %1
  %47 = sext i32 %46 to i64
  %48 = getelementptr i16, i16 addrspace(1)* %42, i64 %47
  %49 = load i16, i16 addrspace(1)* %48, align 2, !tbaa !7, !amdgpu.noclobber !5
  %50 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 1
  store i16 %49, i16 addrspace(3)* %50, align 2, !tbaa !7
  %51 = add nsw i32 %20, 1
  %52 = mul nsw i32 %51, %1
  %53 = sext i32 %52 to i64
  %54 = getelementptr i16, i16 addrspace(1)* %42, i64 %53
  %55 = load i16, i16 addrspace(1)* %54, align 2, !tbaa !7, !amdgpu.noclobber !5
  %56 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 2
  store i16 %55, i16 addrspace(3)* %56, align 2, !tbaa !7
  %57 = sext i32 %12 to i64
  %58 = getelementptr i16, i16 addrspace(1)* %0, i64 %57
  %59 = getelementptr i16, i16 addrspace(1)* %58, i64 %41
  %60 = load i16, i16 addrspace(1)* %59, align 2, !tbaa !7, !amdgpu.noclobber !5
  %61 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 3
  store i16 %60, i16 addrspace(3)* %61, align 2, !tbaa !7
  %62 = mul nsw i32 %20, %1
  %63 = sext i32 %62 to i64
  %64 = getelementptr i16, i16 addrspace(1)* %58, i64 %63
  %65 = load i16, i16 addrspace(1)* %64, align 2, !tbaa !7, !amdgpu.noclobber !5
  %66 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 4
  store i16 %65, i16 addrspace(3)* %66, align 2, !tbaa !7
  %67 = add nsw i32 %20, 1
  %68 = mul nsw i32 %67, %1
  %69 = sext i32 %68 to i64
  %70 = getelementptr i16, i16 addrspace(1)* %58, i64 %69
  %71 = load i16, i16 addrspace(1)* %70, align 2, !tbaa !7, !amdgpu.noclobber !5
  %72 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 5
  store i16 %71, i16 addrspace(3)* %72, align 2, !tbaa !7
  %73 = add nsw i32 %12, 1
  %74 = sext i32 %73 to i64
  %75 = getelementptr i16, i16 addrspace(1)* %0, i64 %74
  %76 = getelementptr i16, i16 addrspace(1)* %75, i64 %41
  %77 = load i16, i16 addrspace(1)* %76, align 2, !tbaa !7, !amdgpu.noclobber !5
  %78 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 6
  store i16 %77, i16 addrspace(3)* %78, align 2, !tbaa !7
  %79 = mul nsw i32 %20, %1
  %80 = sext i32 %79 to i64
  %81 = getelementptr i16, i16 addrspace(1)* %75, i64 %80
  %82 = load i16, i16 addrspace(1)* %81, align 2, !tbaa !7, !amdgpu.noclobber !5
  %83 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 7
  store i16 %82, i16 addrspace(3)* %83, align 2, !tbaa !7
  %84 = add nsw i32 %20, 1
  %85 = mul nsw i32 %84, %1
  %86 = sext i32 %85 to i64
  %87 = getelementptr i16, i16 addrspace(1)* %75, i64 %86
  %88 = load i16, i16 addrspace(1)* %87, align 2, !tbaa !7, !amdgpu.noclobber !5
  %89 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 8
  store i16 %88, i16 addrspace(3)* %89, align 2, !tbaa !7
  %90 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 1
  %91 = load i16, i16 addrspace(3)* %90, align 2, !tbaa !7
  %92 = icmp ult i16 %91, %44
  %93 = zext i1 %92 to i32
  %94 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 2
  %95 = load i16, i16 addrspace(3)* %94, align 2, !tbaa !7
  %96 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %93
  %97 = load i16, i16 addrspace(3)* %96, align 2, !tbaa !7
  %98 = icmp ult i16 %95, %97
  %99 = select i1 %98, i32 2, i32 %93
  %100 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 3
  %101 = load i16, i16 addrspace(3)* %100, align 2, !tbaa !7
  %102 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %99
  %103 = load i16, i16 addrspace(3)* %102, align 2, !tbaa !7
  %104 = icmp ult i16 %101, %103
  %105 = select i1 %104, i32 3, i32 %99
  %106 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 4
  %107 = load i16, i16 addrspace(3)* %106, align 2, !tbaa !7
  %108 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %105
  %109 = load i16, i16 addrspace(3)* %108, align 2, !tbaa !7
  %110 = icmp ult i16 %107, %109
  %111 = select i1 %110, i32 4, i32 %105
  %112 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 5
  %113 = load i16, i16 addrspace(3)* %112, align 2, !tbaa !7
  %114 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %111
  %115 = load i16, i16 addrspace(3)* %114, align 2, !tbaa !7
  %116 = icmp ult i16 %113, %115
  %117 = select i1 %116, i32 5, i32 %111
  %118 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 6
  %119 = load i16, i16 addrspace(3)* %118, align 2, !tbaa !7
  %120 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %117
  %121 = load i16, i16 addrspace(3)* %120, align 2, !tbaa !7
  %122 = icmp ult i16 %119, %121
  %123 = select i1 %122, i32 6, i32 %117
  %124 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 7
  %125 = load i16, i16 addrspace(3)* %124, align 2, !tbaa !7
  %126 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %123
  %127 = load i16, i16 addrspace(3)* %126, align 2, !tbaa !7
  %128 = icmp ult i16 %125, %127
  %129 = select i1 %128, i32 7, i32 %123
  %130 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 8
  %131 = load i16, i16 addrspace(3)* %130, align 2, !tbaa !7
  %132 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %129
  %133 = load i16, i16 addrspace(3)* %132, align 2, !tbaa !7
  %134 = icmp ult i16 %131, %133
  %135 = select i1 %134, i32 8, i32 %129
  %136 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %135
  %137 = load i16, i16 addrspace(3)* %136, align 2, !tbaa !7
  store i16 %137, i16 addrspace(3)* %45, align 2, !tbaa !7
  store i16 %44, i16 addrspace(3)* %136, align 2, !tbaa !7
  %138 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 2
  %139 = load i16, i16 addrspace(3)* %138, align 2, !tbaa !7
  %140 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 1
  %141 = load i16, i16 addrspace(3)* %140, align 2, !tbaa !7
  %142 = icmp ult i16 %139, %141
  %143 = select i1 %142, i32 2, i32 1
  %144 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 3
  %145 = load i16, i16 addrspace(3)* %144, align 2, !tbaa !7
  %146 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %143
  %147 = load i16, i16 addrspace(3)* %146, align 2, !tbaa !7
  %148 = icmp ult i16 %145, %147
  %149 = select i1 %148, i32 3, i32 %143
  %150 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 4
  %151 = load i16, i16 addrspace(3)* %150, align 2, !tbaa !7
  %152 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %149
  %153 = load i16, i16 addrspace(3)* %152, align 2, !tbaa !7
  %154 = icmp ult i16 %151, %153
  %155 = select i1 %154, i32 4, i32 %149
  %156 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 5
  %157 = load i16, i16 addrspace(3)* %156, align 2, !tbaa !7
  %158 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %155
  %159 = load i16, i16 addrspace(3)* %158, align 2, !tbaa !7
  %160 = icmp ult i16 %157, %159
  %161 = select i1 %160, i32 5, i32 %155
  %162 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 6
  %163 = load i16, i16 addrspace(3)* %162, align 2, !tbaa !7
  %164 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %161
  %165 = load i16, i16 addrspace(3)* %164, align 2, !tbaa !7
  %166 = icmp ult i16 %163, %165
  %167 = select i1 %166, i32 6, i32 %161
  %168 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 7
  %169 = load i16, i16 addrspace(3)* %168, align 2, !tbaa !7
  %170 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %167
  %171 = load i16, i16 addrspace(3)* %170, align 2, !tbaa !7
  %172 = icmp ult i16 %169, %171
  %173 = select i1 %172, i32 7, i32 %167
  %174 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 8
  %175 = load i16, i16 addrspace(3)* %174, align 2, !tbaa !7
  %176 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %173
  %177 = load i16, i16 addrspace(3)* %176, align 2, !tbaa !7
  %178 = icmp ult i16 %175, %177
  %179 = select i1 %178, i32 8, i32 %173
  %180 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 1
  %181 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %179
  %182 = load i16, i16 addrspace(3)* %181, align 2, !tbaa !7
  store i16 %182, i16 addrspace(3)* %180, align 2, !tbaa !7
  store i16 %141, i16 addrspace(3)* %181, align 2, !tbaa !7
  %183 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 3
  %184 = load i16, i16 addrspace(3)* %183, align 2, !tbaa !7
  %185 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 2
  %186 = load i16, i16 addrspace(3)* %185, align 2, !tbaa !7
  %187 = icmp ult i16 %184, %186
  %188 = select i1 %187, i32 3, i32 2
  %189 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 4
  %190 = load i16, i16 addrspace(3)* %189, align 2, !tbaa !7
  %191 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %188
  %192 = load i16, i16 addrspace(3)* %191, align 2, !tbaa !7
  %193 = icmp ult i16 %190, %192
  %194 = select i1 %193, i32 4, i32 %188
  %195 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 5
  %196 = load i16, i16 addrspace(3)* %195, align 2, !tbaa !7
  %197 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %194
  %198 = load i16, i16 addrspace(3)* %197, align 2, !tbaa !7
  %199 = icmp ult i16 %196, %198
  %200 = select i1 %199, i32 5, i32 %194
  %201 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 6
  %202 = load i16, i16 addrspace(3)* %201, align 2, !tbaa !7
  %203 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %200
  %204 = load i16, i16 addrspace(3)* %203, align 2, !tbaa !7
  %205 = icmp ult i16 %202, %204
  %206 = select i1 %205, i32 6, i32 %200
  %207 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 7
  %208 = load i16, i16 addrspace(3)* %207, align 2, !tbaa !7
  %209 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %206
  %210 = load i16, i16 addrspace(3)* %209, align 2, !tbaa !7
  %211 = icmp ult i16 %208, %210
  %212 = select i1 %211, i32 7, i32 %206
  %213 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 8
  %214 = load i16, i16 addrspace(3)* %213, align 2, !tbaa !7
  %215 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %212
  %216 = load i16, i16 addrspace(3)* %215, align 2, !tbaa !7
  %217 = icmp ult i16 %214, %216
  %218 = select i1 %217, i32 8, i32 %212
  %219 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 2
  %220 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %218
  %221 = load i16, i16 addrspace(3)* %220, align 2, !tbaa !7
  store i16 %221, i16 addrspace(3)* %219, align 2, !tbaa !7
  store i16 %186, i16 addrspace(3)* %220, align 2, !tbaa !7
  %222 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 4
  %223 = load i16, i16 addrspace(3)* %222, align 2, !tbaa !7
  %224 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 3
  %225 = load i16, i16 addrspace(3)* %224, align 2, !tbaa !7
  %226 = icmp ult i16 %223, %225
  %227 = select i1 %226, i32 4, i32 3
  %228 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 5
  %229 = load i16, i16 addrspace(3)* %228, align 2, !tbaa !7
  %230 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %227
  %231 = load i16, i16 addrspace(3)* %230, align 2, !tbaa !7
  %232 = icmp ult i16 %229, %231
  %233 = select i1 %232, i32 5, i32 %227
  %234 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 6
  %235 = load i16, i16 addrspace(3)* %234, align 2, !tbaa !7
  %236 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %233
  %237 = load i16, i16 addrspace(3)* %236, align 2, !tbaa !7
  %238 = icmp ult i16 %235, %237
  %239 = select i1 %238, i32 6, i32 %233
  %240 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 7
  %241 = load i16, i16 addrspace(3)* %240, align 2, !tbaa !7
  %242 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %239
  %243 = load i16, i16 addrspace(3)* %242, align 2, !tbaa !7
  %244 = icmp ult i16 %241, %243
  %245 = select i1 %244, i32 7, i32 %239
  %246 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 8
  %247 = load i16, i16 addrspace(3)* %246, align 2, !tbaa !7
  %248 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %245
  %249 = load i16, i16 addrspace(3)* %248, align 2, !tbaa !7
  %250 = icmp ult i16 %247, %249
  %251 = select i1 %250, i32 8, i32 %245
  %252 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 3
  %253 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %251
  %254 = load i16, i16 addrspace(3)* %253, align 2, !tbaa !7
  store i16 %254, i16 addrspace(3)* %252, align 2, !tbaa !7
  store i16 %225, i16 addrspace(3)* %253, align 2, !tbaa !7
  %255 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 5
  %256 = load i16, i16 addrspace(3)* %255, align 2, !tbaa !7
  %257 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 4
  %258 = load i16, i16 addrspace(3)* %257, align 2, !tbaa !7
  %259 = icmp ult i16 %256, %258
  %260 = select i1 %259, i32 5, i32 4
  %261 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 6
  %262 = load i16, i16 addrspace(3)* %261, align 2, !tbaa !7
  %263 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %260
  %264 = load i16, i16 addrspace(3)* %263, align 2, !tbaa !7
  %265 = icmp ult i16 %262, %264
  %266 = select i1 %265, i32 6, i32 %260
  %267 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 7
  %268 = load i16, i16 addrspace(3)* %267, align 2, !tbaa !7
  %269 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %266
  %270 = load i16, i16 addrspace(3)* %269, align 2, !tbaa !7
  %271 = icmp ult i16 %268, %270
  %272 = select i1 %271, i32 7, i32 %266
  %273 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 8
  %274 = load i16, i16 addrspace(3)* %273, align 2, !tbaa !7
  %275 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %272
  %276 = load i16, i16 addrspace(3)* %275, align 2, !tbaa !7
  %277 = icmp ult i16 %274, %276
  %278 = select i1 %277, i32 8, i32 %272
  %279 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 4
  %280 = getelementptr inbounds [256 x [9 x i16]], [256 x [9 x i16]] addrspace(3)* @_ZZ16MedianFilter_gpuPtiiE8surround, i32 0, i32 %22, i32 %278
  %281 = load i16, i16 addrspace(3)* %280, align 2, !tbaa !7
  store i16 %281, i16 addrspace(3)* %279, align 2, !tbaa !7
  store i16 %258, i16 addrspace(3)* %280, align 2, !tbaa !7
  %282 = load i16, i16 addrspace(3)* %279, align 2, !tbaa !7
  %283 = mul nsw i32 %20, %1
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %284
  %286 = sext i32 %12 to i64
  %287 = getelementptr inbounds i16, i16 addrspace(1)* %285, i64 %286
  store i16 %282, i16 addrspace(1)* %287, align 2, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %288

288:                                              ; preds = %36, %28, %3
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
