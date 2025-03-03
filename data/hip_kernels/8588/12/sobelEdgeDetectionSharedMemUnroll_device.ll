; ModuleID = '../data/hip_kernels/8588/12/main.cu'
source_filename = "../data/hip_kernels/8588/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem = internal unnamed_addr addrspace(3) global [4096 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z33sobelEdgeDetectionSharedMemUnrollPiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul i32 %6, 60
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = shl nuw nsw i32 %8, 1
  %10 = add i32 %7, %9
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = mul i32 %11, 60
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = shl nuw nsw i32 %13, 1
  %15 = add i32 %12, %14
  %16 = mul nsw i32 %15, %2
  %17 = add nsw i32 %10, %16
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !5, !amdgpu.noclobber !9
  %21 = shl nuw nsw i32 %13, 7
  %22 = add nuw nsw i32 %9, %21
  %23 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %22
  store i32 %20, i32 addrspace(3)* %23, align 8, !tbaa !5
  %24 = or i32 %15, 1
  %25 = mul nsw i32 %24, %2
  %26 = add nsw i32 %10, %25
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = shl nuw nsw i32 %13, 7
  %31 = add nuw nsw i32 %30, 64
  %32 = add nuw nsw i32 %9, %31
  %33 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %32
  store i32 %29, i32 addrspace(3)* %33, align 8, !tbaa !5
  %34 = or i32 %10, 1
  %35 = add nuw nsw i32 %9, 1
  %36 = add nsw i32 %34, %16
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = add nuw nsw i32 %35, %21
  %41 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %40
  store i32 %39, i32 addrspace(3)* %41, align 4, !tbaa !5
  %42 = add nsw i32 %34, %25
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = add nuw nsw i32 %35, %31
  %47 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %46
  store i32 %45, i32 addrspace(3)* %47, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = icmp ne i32 %13, 0
  %49 = add nsw i32 %8, -1
  %50 = icmp ult i32 %49, 30
  %51 = select i1 %50, i1 %48, i1 false
  %52 = icmp ult i32 %13, 31
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %54, label %196

54:                                               ; preds = %5
  %55 = add nsw i32 %9, -1
  %56 = add nsw i32 %21, -64
  %57 = add nsw i32 %56, %35
  %58 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %57
  %59 = load i32, i32 addrspace(3)* %58, align 4, !tbaa !5
  %60 = add nsw i32 %56, %55
  %61 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %60
  %62 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !5
  %63 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %64 = add nsw i32 %21, %55
  %65 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %64
  %66 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !5
  %67 = add nuw nsw i32 %21, 64
  %68 = add nuw nsw i32 %67, %35
  %69 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %68
  %70 = load i32, i32 addrspace(3)* %69, align 4, !tbaa !5
  %71 = add nsw i32 %67, %55
  %72 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %71
  %73 = load i32, i32 addrspace(3)* %72, align 4, !tbaa !5
  %74 = sub i32 %63, %66
  %75 = shl i32 %74, 1
  %76 = add i32 %59, %70
  %77 = add i32 %62, %73
  %78 = sub i32 %76, %77
  %79 = add i32 %78, %75
  %80 = add nsw i32 %9, %56
  %81 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %80
  %82 = load i32, i32 addrspace(3)* %81, align 8, !tbaa !5
  %83 = add nuw nsw i32 %9, %67
  %84 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %83
  %85 = load i32, i32 addrspace(3)* %84, align 8, !tbaa !5
  %86 = sub i32 %82, %85
  %87 = shl i32 %86, 1
  %88 = add i32 %62, %59
  %89 = add i32 %70, %73
  %90 = sub i32 %88, %89
  %91 = add i32 %90, %87
  %92 = mul nsw i32 %79, %79
  %93 = mul nsw i32 %91, %91
  %94 = add nuw nsw i32 %93, %92
  %95 = icmp sgt i32 %94, %4
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %18
  %97 = select i1 %95, i32 255, i32 0
  store i32 %97, i32 addrspace(1)* %96, align 4, !tbaa !5
  %98 = add nuw nsw i32 %30, %35
  %99 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %98
  %100 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !5
  %101 = add nsw i32 %30, %55
  %102 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %101
  %103 = load i32, i32 addrspace(3)* %102, align 4, !tbaa !5
  %104 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !5
  %105 = add nsw i32 %31, %55
  %106 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %105
  %107 = load i32, i32 addrspace(3)* %106, align 4, !tbaa !5
  %108 = add nuw nsw i32 %30, 128
  %109 = add nuw nsw i32 %108, %35
  %110 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %109
  %111 = load i32, i32 addrspace(3)* %110, align 4, !tbaa !5
  %112 = add nsw i32 %108, %55
  %113 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %112
  %114 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !5
  %115 = sub i32 %104, %107
  %116 = shl i32 %115, 1
  %117 = add i32 %100, %111
  %118 = add i32 %103, %114
  %119 = sub i32 %117, %118
  %120 = add i32 %119, %116
  %121 = add nuw nsw i32 %9, %30
  %122 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %121
  %123 = load i32, i32 addrspace(3)* %122, align 8, !tbaa !5
  %124 = add nuw nsw i32 %9, %108
  %125 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %124
  %126 = load i32, i32 addrspace(3)* %125, align 8, !tbaa !5
  %127 = sub i32 %123, %126
  %128 = shl i32 %127, 1
  %129 = add i32 %103, %100
  %130 = add i32 %111, %114
  %131 = sub i32 %129, %130
  %132 = add i32 %131, %128
  %133 = mul nsw i32 %120, %120
  %134 = mul nsw i32 %132, %132
  %135 = add nuw nsw i32 %134, %133
  %136 = icmp sgt i32 %135, %4
  %137 = select i1 %136, i32 255, i32 0
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %27
  store i32 %137, i32 addrspace(1)* %138, align 4, !tbaa !5
  %139 = add nuw nsw i32 %9, 2
  %140 = add nsw i32 %56, %139
  %141 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %140
  %142 = load i32, i32 addrspace(3)* %141, align 8, !tbaa !5
  %143 = add nuw nsw i32 %21, %139
  %144 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %143
  %145 = load i32, i32 addrspace(3)* %144, align 8, !tbaa !5
  %146 = load i32, i32 addrspace(3)* %23, align 8, !tbaa !5
  %147 = add nuw nsw i32 %67, %139
  %148 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %147
  %149 = load i32, i32 addrspace(3)* %148, align 8, !tbaa !5
  %150 = sub i32 %145, %146
  %151 = shl i32 %150, 1
  %152 = add i32 %142, %149
  %153 = add i32 %82, %85
  %154 = sub i32 %152, %153
  %155 = add i32 %154, %151
  %156 = sub i32 %59, %70
  %157 = shl i32 %156, 1
  %158 = add i32 %82, %142
  %159 = add i32 %149, %85
  %160 = sub i32 %158, %159
  %161 = add i32 %160, %157
  %162 = mul nsw i32 %155, %155
  %163 = mul nsw i32 %161, %161
  %164 = add nuw nsw i32 %163, %162
  %165 = icmp sgt i32 %164, %4
  %166 = select i1 %165, i32 255, i32 0
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %37
  store i32 %166, i32 addrspace(1)* %167, align 4, !tbaa !5
  %168 = add nuw nsw i32 %30, %139
  %169 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %168
  %170 = load i32, i32 addrspace(3)* %169, align 8, !tbaa !5
  %171 = add nuw nsw i32 %31, %139
  %172 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %171
  %173 = load i32, i32 addrspace(3)* %172, align 8, !tbaa !5
  %174 = load i32, i32 addrspace(3)* %33, align 8, !tbaa !5
  %175 = add nuw nsw i32 %108, %139
  %176 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ33sobelEdgeDetectionSharedMemUnrollPiS_iiiE5shMem, i32 0, i32 %175
  %177 = load i32, i32 addrspace(3)* %176, align 8, !tbaa !5
  %178 = sub i32 %173, %174
  %179 = shl i32 %178, 1
  %180 = add i32 %170, %177
  %181 = add i32 %123, %126
  %182 = sub i32 %180, %181
  %183 = add i32 %182, %179
  %184 = sub i32 %100, %111
  %185 = shl i32 %184, 1
  %186 = add i32 %123, %170
  %187 = add i32 %177, %126
  %188 = sub i32 %186, %187
  %189 = add i32 %188, %185
  %190 = mul nsw i32 %183, %183
  %191 = mul nsw i32 %189, %189
  %192 = add nuw nsw i32 %191, %190
  %193 = icmp sgt i32 %192, %4
  %194 = select i1 %193, i32 255, i32 0
  %195 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %43
  store i32 %194, i32 addrspace(1)* %195, align 4, !tbaa !5
  br label %196

196:                                              ; preds = %54, %5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
